<%--
  ~ #%L
  ~ ACS AEM Commons Bundle
  ~ %%
  ~ Copyright (C) 2013 Adobe
  ~ %%
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~      http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  ~ #L%
  --%>

<form   class="coral-Form coral-Form--vertical"
        novalidate
        name="params"
        ng-show="!app.running"
        ng-submit="remove(params.$valid)">

    <section class="coral-Form-fieldset">
        <h3 class="coral-Form-fieldset-legend">Statuses</h3>

        <div class="coral-Form-fieldwrapper">
            <label acs-coral-checkbox ng-repeat="status in formOptions.statuses">
                <input type="checkbox"
                       name="selectedStatuses[]"
                       value="{{status}}"
                       ng-checked="form.selection.indexOf(status) > -1"
                       ng-click="toggleStatusSelection(status)"><span>{{status}}</span></label>
        </div>

        <div class="instructions">{{data.status.status}}</div>
    </section>


    <section class="coral-Form-fieldset">
        <h3 class="coral-Form-fieldset-legend">Payload Paths</h3>

        <table class="data">
            <thead>
            <tr>
                <th>Payload Path Regex</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="payload in form.payloads">
                <td><input type="text"
                           ng-model="payload.pattern"/></td>
                <td class="action-col property-remove">
                    <i ng-show="form.payloads.length > 1" ng-click="form.payloads.splice($index, 1)"
                       class="coral-Icon coral-Icon--minusCircle"></i>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2" class="property-add">
                    <span ng-click="form.payloads.push({})">
                        <i class="coral-Icon coral-Icon--addCircle withLabel"></i>
                        Add Payload Path Pattern
                     </span>
                </td>
            </tr>
            </tfoot>
        </table>
    </section>

    <section class="coral-Form-fieldset">
        <h3 class="coral-Form-fieldset-legend">Older Than</h3>

        <div class="coral-Datepicker coral-InputGroup" data-init="datepicker">
          <input class="coral-InputGroup-input coral-Textfield" ng-model="form.olderThan" type="date">
          <span class="coral-InputGroup-button">
            <button class="coral-Button coral-Button--secondary coral-Button--square" type="button" title="Datetime Picker">
              <i class="coral-Icon coral-Icon--sizeS coral-Icon--calendar"></i>
            </button>
          </span>
        </div>
    </section>

    <section class="coral-Form-fieldset">
        <h3 class="coral-Form-fieldset-legend">Models</h3>

        <div class="instructions">
            If no Workflow Models are selected, Workflow Instances will not be filtered by Workflow Model.
        </div>

        <%-- First Col --%>
        <table class="data table-col-1">
            <tbody>
            <tr ng-repeat="workflowModel in formOptions.workflowModels.slice(0, formOptions.workflowModels.length / 2)">
                <td class="action-col"><label acs-coral-checkbox><input
                        ng-checked="form.models.indexOf(workflowModel.id) >= 0"
                        ng-click="toggleModelSelection(workflowModel.id)"
                        type="checkbox"><span>{{ workflowModel.title }}</span></label></td>
            </tr>

            </tbody>
        </table>

        <%-- Second Col --%>

        <table class="data table-col-2">
            <tbody>
            <tr
                    ng-repeat="workflowModel in formOptions.workflowModels.slice((formOptions.workflowModels.length / 2) + 1, formOptions.workflowModels.length)">
                <td class="action-col"><label acs-coral-checkbox><input
                        ng-checked="form.models.indexOf(workflowModel.id) >= 0"
                        ng-click="toggleModelSelection(workflowModel.id)"
                        type="checkbox"><span>{{ workflowModel.title }}</span></label></td>
            </tr>

            </tbody>
        </table>

    </section>
    
    <br clear="all"/>

    <hr/>

    <div class="form-row">
        <div class="form-left-cell">&nbsp;</div>

        <button type="submit"
                role="button"
                class="coral-Button coral-Button--primary">Remove Workflows</button>
    </div>
</form>