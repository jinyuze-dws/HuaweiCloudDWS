
##在lb_task_meta表中查询出所有和'疑为浸润癌'的所有内容
select count(*) from dw_kingmed.LB_TASK_META where taskid in (select taskid from dw_kingmed.LB_TASK_DETAIL where item_name='testItemName' and itme_value = '疑为浸润癌')