# My Industrial Robotics Labs
Here are the hands-on labs completed during the industrial robotics course of <em>CEGEP de Victoriaville</em>.

## My background
At the moment of this writing, I'm a Software Technology Manager at [Cogiscan](https://cogiscan.com/)  with a strong background in software development, and computer engineering in general.

## Labs
Labs [#1](lab_1_stencil.mod), [#4](lab_4_leapfrog.mod), and [#5](lab_5_the_wall.mod) were simulations using RobotStudio from ABB.

Labs [#2](lab_2_tracing.mod), [#3](lab_3_weight.mod), [#6](lab_6_commissioning_the_irc5.mod), [#7](lab_7_io.mod), [#8](lab_8_zones_and_interrupts.mod), and [final exam](final_exam.mod) were developed using the IRB 140 6-axis industrial robot ([external link](https://new.abb.com/products/robotics/industrial-robots/irb-140)).

Most labs were created from scratch, and had to be completed during a 3-hour window.

Lab | Name                                                       | Simulation | ABB IRB 140 | Media                                           | Learnings
:-: | :--------------------------------------------------------- | :--------: | :---------: | :---------------------------------------------- | :----------------------------------------------------------
1   | [stencil](lab_1_stencil.mod)                               | ✓          |             | [screenshot](media/lab_1_stencil.png)           | positioning instructions (`MoveJ`, `MoveL`, `MoveC`)
2   | [tracing](lab_2_tracing.mod)                               |            | ✓           | [picture](media/lab_2_tracing.png)              | FlexPendant usage, coordinate systems, jogging, singularity
3   | [weight](lab_3_weight.mod)                                 |            | ✓           |                                                 | calibration, fork tool, work objects
4   | [leapfrog](lab_4_leapfrog.mod)                             | ✓          |             | [screenshot](media/lab_4_leapfrog.png)          | offset instruction (`Offs`), procedures and functions
5   | [the wall](lab_5_the_wall.mod)                             | ✓          |             | [screenshot](media/lab_5_the_wall.png)          | gripper tool, FlexPendant display, `Clock` type
6   | [commissioning the IRC5](lab_6_commissioning_the_irc5.mod) |            | ✓           | [video](media/lab_6_commissioning_the_irc5.mp4) | system creation, I/O configuration, joints limitation
7   | [I/O](lab_7_io.mod)                                        |            | ✓           |                                                 | DeviceNet, I/O usage in RAPID
8   | [zones and interrupts](lab_8_zones_and_interrupts.mod)     |            | ✓           |                                                 | world zones, limits, interrupts 
\-  | [final exam](final_exam.mod)                               |            | ✓           | [picture](media/final_exam.jpg)                 | \-

## Coding convention
No official coding convention was enforced by the instructor. Programs had to be turned-in with French identifiers where possible, and usage of global variables was encouraged for simplicity purposes.

Programs of this repository were converted to English before publication. Some errors might have creeped in during the translation process.

The following sections list the personal convention that I adhered to for most of the labs.

### Routines
Routine      | Identifier prefix | Example
:----------- | :---------------: | :------
function     | `f`               | `FUNC num fComputeSomething(...)`
procedure    | `p`               | `PROC pDoSomething(...)`
trap         | `t`               | `TRAP tSomethingHappened`

### Constants and variables
Constant / Variable  | RAPID types                          | Identifier prefix | Example
:------------------- | :----------------------------------- | :---------------: | :------
boolean              | `bool`                               | `b`               | `bool bDisassemble`
interrupt identity   | `intnum`                             | `i`               | `intnum iButtonPressed`
load                 | `loaddata`                           | `load`            | `loaddata loadDice`
number               | `num`                                | `n`               | `num nOffsetX`
position             | `robtarget`, `joint position`, `pos` | `p`               | `robtarget pHome`
shape                | `shapedata`                          | `z`               | `shapedata zBox`
speed                | `speeddata`                          | `v`               | `speeddata vFast`
timer                | `clock`                              | `c`               | `clock cClock`
tool                 | `tooldata`                           | `t`               | `tooldata tPencil`
work object          | `wobjdata`                           | `wobj`            | `wobjdata wobjStencil`
world zone           | `wztemporary`                        | `wz`              | `wztemporary wzSupplyArea`
