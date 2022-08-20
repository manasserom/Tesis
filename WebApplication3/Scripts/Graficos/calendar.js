class Calendar {
    constructor(id) {
        this.cells = [];
        this.selectedDate = null;
        this.currentMonth = moment();
        this.elCalendar = document.getElementById(id);
        this.showTemplate();
        this.elGridBody = this.elCalendar.querySelector('.grid__body');
        this.elMonthName = this.elCalendar.querySelector('.month-name');
        this.showCells();
    }

    showTemplate() {
        this.elCalendar.innerHTML = this.getTemplate();
        this.addEventListenerToControls();
    }

    getTemplate() {
        let template = `
            <div class="calendar__header">
                <button type="button" class="control control--prev">&lt;</button>
                <span class="month-name">dic 2019</span>
                <button type="button" class="control control--next">&gt;</button>
            </div>
            <div class="calendar__body">
                <div class="grid">
                    <div class="grid__header">
                        <span class="grid__cell grid__cell--gh">Lun</span>
                        <span class="grid__cell grid__cell--gh">Mar</span>
                        <span class="grid__cell grid__cell--gh">Mié</span>
                        <span class="grid__cell grid__cell--gh">Jue</span>
                        <span class="grid__cell grid__cell--gh">Vie</span>
                        <span class="grid__cell grid__cell--gh">Sáb</span>
                        <span class="grid__cell grid__cell--gh">Dom</span>
                    </div>
                    <div class="grid__body">

                    </div>
                </div>
            </div>
        `;
        return template;
    }

    addEventListenerToControls() {
        let elControls = this.elCalendar.querySelectorAll('.control');
        elControls.forEach(elControl => {
            elControl.addEventListener('click', e => {
                let elTarget = e.target;
                if (elTarget.classList.contains('control--next')) {
                    this.changeMonth(true);
                } else {
                    this.changeMonth(false);
                }
                this.showCells();
            });
        });
    }

    changeMonth(next = true) {
        if (next) {
            this.currentMonth.add(1, 'months');
        } else {
            this.currentMonth.subtract(1, 'months');
        }
    }

    showCells() {
        this.cells = this.generateDates(this.currentMonth);
        //let VencimientosDia = [5, 9, 10, 25];//remplazar poe el listado de dias
        //let VencimientosMes = [4, 4, 5, 4];//remplazar poe el listado de Mes - RESTAR 1 
        //let borrarAnio = [2022, 2022, 2021, 2022];//remplazar poe el listado de Anios
        let VencimientosDia = " " + document.getElementById('calendarDay').getAttribute('value');
        let VencimientosMes = " " + document.getElementById('calendarMont').getAttribute('value');
        var cd = VencimientosDia.split(",");
        var cm = VencimientosMes.split(",");
        let bandera = false;
        let borrarAnio = [2022, 2022, 2021, 2022];//remplazar poe el listado de Anios
        if (this.cells === null) {
            console.error('No fue posible generar las fechas del calendario.');
            return;
        }

        this.elGridBody.innerHTML = '';
        let templateCells = '';
        let disabledClass = '';
        for (let i = 0; i < this.cells.length; i++) {
            disabledClass = '';
            if (!this.cells[i].isInCurrentMonth) {
                disabledClass = 'grid__cell--disabled';
            }
            bandera = false;
            for (let j = 0; j < cd.length; j++) {
                //var auxfecha = this.cells[i].date.year;
                //var auxfecha2 = this.cells[i].date.years;
                if (this.cells[i].date.date() == cd[j]
                    && this.cells[i].date.month() == cm[j] - 1 && bandera != true
                    //&& this.cells[i].date.getFullYear() == borrarAnio[j]
                ) {
                    templateCells += `
                <span class="grid__cell grid__cell--gd ${disabledClass}" data-cell-id="${i}" style="background-color: #ff2301;">
                    ${this.cells[i].date.date()}
                </span>
            `;
                    bandera = true;

                }
            }
            if (bandera == false) {
                templateCells += `
                <span class="grid__cell grid__cell--gd ${disabledClass}" data-cell-id="${i}"">
                    ${this.cells[i].date.date()}
                </span>
            `;

            }
        //    // <span class="grid__cell grid__cell--gd grid__cell--selected">1</span>
        //    templateCells += `
        //        <span class="grid__cell grid__cell--gd ${disabledClass}" data-cell-id="${i}"">
        //            ${this.cells[i].date.date()}
        //        </span>
        //    `;
        }
        this.elMonthName.innerHTML = this.currentMonth.format('MMM YYYY');
        this.elGridBody.innerHTML = templateCells;
        this.addEventListenerToCells();
    }

    generateDates(monthToShow = moment()) {
        if (!moment.isMoment(monthToShow)) {
            return null;
        }
        let dateStart = moment(monthToShow).startOf('month');
        let dateEnd = moment(monthToShow).endOf('month');
        let cells = [];

        // Encontrar la primer fecha que se va a mostrar en el calendario
        while (dateStart.day() !== 1) {
            dateStart.subtract(1, 'days');
        }

        // Encontrar la última fecha que se va a mostrar en el calendario
        while (dateEnd.day() !== 0) {
            dateEnd.add(1, 'days');
        }

        // Genera las fechas del grid
        do {
            cells.push({
                date: moment(dateStart),
                isInCurrentMonth: dateStart.month() === monthToShow.month()
            });
            dateStart.add(1, 'days');
        } while (dateStart.isSameOrBefore(dateEnd));
        //let borrar = [1, 3, 5, 6];
        //for (let i = 0; borrar.length > i; i++) {
        //    cells[i].
        //}
        return cells;
    }

    addEventListenerToCells() {
        let elCells = this.elCalendar.querySelectorAll('.grid__cell--gd');
        elCells.forEach(elCell => {
            elCell.addEventListener('click', e => {
                let elTarget = e.target;
                if (elTarget.classList.contains('grid__cell--disabled') || elTarget.classList.contains('grid__cell--selected')) {
                    return;
                }
                // Deselecionar la celda anterior
                let selectedCell = this.elGridBody.querySelector('.grid__cell--selected');
                if (selectedCell) {
                    selectedCell.classList.remove('grid__cell--selected');
                }
                // Selecionar la nueva celda
                elTarget.classList.add('grid__cell--selected');
                this.selectedDate = this.cells[parseInt(elTarget.dataset.cellId)].date;
                // Lanzar evento change
                this.elCalendar.dispatchEvent(new Event('change'));
            });
        });
    }

    getElement() {
        return this.elCalendar;
    }

    value() {
        return this.selectedDate;
    }
}
