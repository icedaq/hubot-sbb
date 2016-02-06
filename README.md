## Hubot SBB

Access Swiss public transportation info using hubot.

## How to use

**Install**
```
npm install --save hubot-sbb
```

In `external-scripts.json` add

```
"hubot-sbb"
```

**Configuration**

There is nothing to be configured at the moment.

**Sample Interaction**

```
user> hyperion sbb from Dübendorf to Bern
hubot> Dübendorf -> Bern
1. 21:04 - 22:28. Journey: 'Dübendorf' -> 'Zürich HB', 'Zürich HB' -> 'Bern'.
2. 21:34 - 23:02. Journey: 'Dübendorf' -> 'Zürich HB', 'Zürich HB' -> 'Bern'.
3. 22:04 - 23:31. Journey: 'Dübendorf' -> 'Zürich HB', 'Zürich HB' -> 'Bern'.
```
