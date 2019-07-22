import { Component, OnInit } from "@angular/core";
import { ActivatedRoute } from "@angular/router";
import { RouterExtensions } from "nativescript-angular/router";

import { Observable } from "rxjs/Observable";
import { map, switchMap } from "rxjs/operators";

import { Result, Run } from "../../models";
import { EventService, RunService } from "../../services";

@Component({
    selector: "RunsDetails",
    moduleId: module.id,
    templateUrl: "./run-details.component.html"
})
export class RunDetailsComponent implements OnInit {
    run$: Observable<Run>;
    results$: Observable<Result[]>;

    constructor(
        private runService: RunService,
        private eventService: EventService,
        private route: ActivatedRoute,
        private routerExtensions: RouterExtensions) {
    }

    ngOnInit(): void {
        const id$: Observable<string> = this.route.params.pipe(
            map(params => params["id"])
        );

        this.run$ = id$.pipe(
            switchMap(runId => this.runService.getByCurrentUser()
                .pipe(
                    map(runs => runs.filter(r => r.id === runId)[0])
                )
            )
        );

        this.results$ = id$.pipe(
            switchMap(runId => this.runService.getRunDetails(runId)),
            switchMap(rDetails => this.eventService.getResultsDetailsById(rDetails.eventId))
        );
    }

    onNavBtnTap(): void {
        this.routerExtensions.back();
    }
}
