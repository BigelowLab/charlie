# Topology and Queues

PBS Pro uses queues to manage system resources. For example, some queues have higher priority than others, some are only available to specific users \(e.g. scgc\), and some are specific to specific CPUs \(e.g. scgc & c2\).

Routing queues automatically put your job into the appropriate queue based on the resources that you requested. There is one routing queue for general use and one for scgc-only.

{% tabs %}
{% tab title="General Queues" %}
| Route | **Queue** | CPU | Memory | Time | Priority | Access | Nodes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| route | normal |  |  | 2w | 100 |  | c1,c3 |
| route | long |  |  | 6w | 100 | restricted | c1,c3 |
|  | high |  |  | 2w | 150 | restricted | c1,c3 |
|  | low |  |  | 8h | 10 |  | c1,c2,c3 |
|  | devel | 8 | 8 GB | 8h | 300 |  | c1,c3 |
{% endtab %}

{% tab title="SCGC Queues" %}
| Route | **Queue** | CPU | Memory | Time | Priority | Access | Nodes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| scgc-route | scgc-normal |  |  | 2w | 100 |  | c2,c3 |
| scgc-route | scgc-long |  |  | 6w | 100 | restricted | c2,c3 |
|  | scgc-high |  |  | 2w | 150 | restricted | c2,c3 |
|  | scgc-low |  |  | 8h | 10 |  | c2,c2,c3 |
|  | scgc-devel | 8 | 8 GB | 8h | 300 |  | c2,c3 |
{% endtab %}
{% endtabs %}

### Topology overview

![](.gitbook/assets/image.png)

