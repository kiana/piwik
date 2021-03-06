<div id="SegmentEditor" style="display:none;">
    <div class="segmentationContainer listHtml">
        <span class="segmentationTitle"></span>

        <ul class="submenu">
            <li>{'SegmentEditor_SelectSegmentOfVisitors'|translate}
                <div class="segmentList">
                    <ul>
                    </ul>
                </div>
            </li>
        </ul>
        {if $authorizedToCreateSegments}
            <a class="add_new_segment">{'SegmentEditor_AddNewSegment'|translate}</a>
        {else}
            <ul class="submenu">
            <li> <span class='youMustBeLoggedIn'>{'SegmentEditor_YouMustBeLoggedInToCreateSegments'|translate}
                <br/>&rsaquo; <a href='index.php?module={$loginModule}'>{'Login_LogIn'|translate}</a> </span></strong>
            </li>
            </ul>
        {/if}
    </div>

    <div class="initial-state-rows">{* no space here important for jquery *}<div class="segment-add-row initial"><div>
        <span>+ {'SegmentEditor_DragDropCondition'|translate}</span>
    </div></div>
    <div class="segment-and">{'SegmentEditor_OperatorAND'|translate}</div>
    <div class="segment-add-row initial"><div>
        <span>+ {'SegmentEditor_DragDropCondition'|translate}</span>
    </div></div>
    </div>

    <div class="segment-row-inputs">
        <div class="segment-input metricListBlock">
            <select title="{'SegmentEditor_ChooseASegment'|translate}" class="metricList">
                {foreach from=$segmentsByCategory key=category item=segmentsInCategory}
                <optgroup label="{$category}">
                    {foreach from=$segmentsInCategory item=segmentInCategory}
                        <option data-type="{$segmentInCategory.type}" value="{$segmentInCategory.segment}">{$segmentInCategory.name}</option>
                    {/foreach}
                </optgroup>
                {/foreach}
            </select>
        </div>
        <div class="segment-input metricMatchBlock">
            <select title="{'General_Matches'|translate}">
                <option value="==">{'General_OperationEquals'|translate}</option>
                <option value="!=">{'General_OperationNotEquals'|translate}</option>
                <option value="<=">{'General_OperationAtMost'|translate}</option>
                <option value=">=">{'General_OperationAtLeast'|translate}</option>
                <option value="<">{'General_OperationLessThan'|translate}</option>
                <option value=">">{'General_OperationGreaterThan'|translate}</option>
                <option value="=@">{'General_OperationContains'|translate}</option>
                <option value="!@">{'General_OperationDoesNotContain'|translate}</option>
            </select>
        </div>
        <div class="segment-input metricValueBlock">
            <input type="text" title="{'General_Value'|translate}">
        </div>
        <div class="clear"></div>
    </div>
    <div class="segment-rows">
        <div class="segment-row">
            <a href="#" class="segment-close"></a>
            <a href="#" class="segment-loading"></a>
        </div>
    </div>
    <div class="segment-or">{'SegmentEditor_OperatorOR'|translate}</div>
    <div class="segment-add-or"><div>
            {capture assign='orCondition'}<span>{'SegmentEditor_OperatorOR'|translate}</span>{/capture}
            <a href="#"> + {'SegmentEditor_AddANDorORCondition'|translate:$orCondition} </a>
        </div>
    </div>
    <div class="segment-and">{'SegmentEditor_OperatorAND'|translate}</div>
    <div class="segment-add-row"><div>
            {capture assign='andCondition'}<span>{'SegmentEditor_OperatorAND'|translate}</span>{/capture}
            <a href="#">+ {'SegmentEditor_AddANDorORCondition'|translate:$andCondition}</a>
        </div>
    </div>
    <div style="position: absolute; z-index:999; width:1040px;" class="segment-element">
        <div class="segment-nav">
            <h4 class="visits"><span id="available_segments"><strong>
                <select id="available_segments_select"></select>
            </strong></span></h4>
            <div class="scrollable">
            <ul>
            {foreach from=$segmentsByCategory key=category item=segmentsInCategory}
                <li data="visit"><a class="metric_category" href="#">{$category}</a>
                    <ul style="display:none">
                        {foreach from=$segmentsInCategory item=segmentInCategory}
                        <li data-metric="{$segmentInCategory.segment}"><a class="ddmetric" href="#">{$segmentInCategory.name}</a></li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
            </ul>
            </div>
            <div class="custom_select_search">
                <a href="#"></a>
                <input type="text" aria-haspopup="true" aria-autocomplete="list" role="textbox" autocomplete="off" class="inp ui-autocomplete-input" id="segmentSearch" value="{'General_Search'|translate}" length="15">
            </div>
        </div>
        <div class="segment-content">
            {if $isSuperUser}
            <div class="segment-top">
                {'SegmentEditor_ThisSegmentIsVisibleTo'|translate} <span id="enable_all_users"><strong>
                        <select id="enable_all_users_select">
                            <option selected="1" value="0">{'SegmentEditor_VisibleToMe'|translate}</option>
                            <option value="1">{'SegmentEditor_VisibleToAllUsers'|translate}</option>
                        </select>
                    </strong></span>

                {'SegmentEditor_SegmentIsDisplayedForWebsite'|translate}<span id="visible_to_website"><strong>
                        <select id="visible_to_website_select">
                            <option selected="" value="{$idSite}">{'SegmentEditor_SegmentDisplayedThisWebsiteOnly'|translate}</option>
                            <option value="0">{'SegmentEditor_SegmentDisplayedAllWebsites'|translate}</option>
                        </select>
                    </strong></span>
                {'General_And'|translate} <span id="auto_archive"><strong>
                        <select id="auto_archive_select">
                            <option selected="1" value="0">{'SegmentEditor_AutoArchiveRealTime'|translate} {'General_DefaultAppended'|translate}</option>
                            <option value="1">{'SegmentEditor_AutoArchivePreProcessed'|translate} </option>
                        </select>
                    </strong></span>

            </div>
            {/if}
            <h3>{'General_Name'|translate}: <span  class="segmentName"></span> <a class="editSegmentName" href="#">{'General_Edit'|translate|strtolower}</a></h3>
        </div>
        <div class="segment-footer">
            <span class="segmentFooterNote">The Segment Editor was <a class='crowdfundingLink' href='http://crowdfunding.piwik.org/custom-segments-editor/' target='_blank'>crowdfunded</a> with the awesome support of 80 companies and Piwik users worldwide!</span>
            <a class="delete" href="#">{'General_Delete'|translate}</a>
            <a class="close" href="#">{'General_Close'|translate}</a>
            <button class="saveAndApply">{'SegmentEditor_SaveAndApply'|translate}</button>
        </div>
    </div>
</div>

<span id="segmentEditorPanel">
    <div id="segmentList"></div>
</span>

<div class="ui-confirm" id="segment-delete-confirm">
    <h2>{'SegmentEditor_AreYouSureDeleteSegment'|translate}</h2>
    <input role="yes" type="button" value="{'General_Yes'|translate}"/>
    <input role="no" type="button" value="{'General_No'|translate}"/>
</div>

<script type="text/javascript">
var availableSegments = {$savedSegmentsJson};
var segmentTranslations = {$segmentTranslations};
</script>
