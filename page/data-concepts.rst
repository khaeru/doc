Concepts for transport data
***************************

:slug: transport-data-concepts
:status: hidden

This post gives precise definitions for terms related to data, especially transport data, as well as processes and practices for working with data.
It is intended to provide a common language for discussions around the **Transport Data Commons** (TDC) and **TDC Initiative** (TDCI).

In casual or colloquial use, many of these terms have *multiple, different meanings*.
When we use the terms without clarifying what we mean, we miscommunicate: the listener may get an incorrect sense of what we truly mean.

**How to use this document:**

- Use Ctrl+F in your browser and search for occurrences of a particular term.
- Click on any heading to jump back to the table of contents.

.. contents::

Concepts and terms
==================

General
-------

Data
   We generally mean *quantitative* data, but data can be qualitative, too.

Metadata
   Information *about* some data that helps explain its meaning, and helps people and systems decide what to do with the data.

   Metadata can be exchanged *together with* or *separately from* the data to which it is related.

Basic terms from SDMX
---------------------
The `SDMX Information Model <https://sdmx.org/wp-content/uploads/SDMX_3-0-0_SECTION_2_FINAL-1_0.pdf>`__ (PDF link) provides very clear and well-distinguished terms for concepts related to data and metadata.
These include:

_`Observation`
   A single “data point”, usually with a numerical **(observation) value** and a `key`_.

_`Data set`
   Zero or more observations whose keys share a common structure.

_`Data flow`
   One or more data sets that share a common structure.

.. _concept:

_`Key`
   Labels or values for one or more `dimensions`_ that uniquely identify an observation within a data set.
   Every dimension corresponds to a single **concept** that distinguishes some observations from others.

   For example, two observations in a data set may be:

   - key = (GEO=KE, TIME_PERIOD=2020) → value = 12.3
   - key = (GEO=IN, TIME_PERIOD=2020) → value = 11.2

   Key values can be free-form, or they can be from a list of codes:

.. _codelist:

_`Code`
   A single code comprises:

   Identifier (ID)
     Short, machine-readable, unambiguous.
     Example: “``GEO``”.
   Name
     Short, human-readable. In SDMX, names are “international strings” that may have distinct values in different languages.
     Example: “Geographical area”.

   Description
     Longer, human-readable text that gives further information on the code, how it may be distinguished from or relate to others, etc.
     Example: “The area described by a statistical observation. …”

   Codes are collected in **code lists** that may be hierarchical, or not.

Data structure [description] (_`DSD`)
   Collects several items that describe the structure of a *data flow* and all *data sets* within that data flow:

   List of _`dimensions`
      Each is linked to a concept.
      Often the dimension and concept have identical IDs.

      - The **representation** for this dimension in observation keys.
        This can (optionally) be done by *reference* to a codelist, e.g. a DSD might specify, “the ``GEO`` dimension is represented by codes from codelist ‘A’, which contains codes with IDs from ISO 3166 alpha-2, e.g. ``AT``, ``CA``, ``US``”.
        A different DSD might specify “the ``GEO`` dimension is represented by codes from codelist ‘B’, which contains codes with IDs from ISO 3166 alpha-3, e.g. ``AUT``, ``CAN``, ``USA``”.

        In either case, valid data will have the described structure.

   Primary measure
      This is also a concept, and describes *what is measured* by the observation values.

      Example: passenger travel distance.

      - This is sometimes called an “indicator”: this means it is used to *indicate* something about a general phenomenon for which there might be several different measures.
        Example: GDP is an *indicator* of economic activity; but economic activity can be measured in other ways.
      - *What is measured* and the *units of measurement* are separate.
        Example: passenger travel distance can be measured in miles, kilometres, or other units.
      - “Primary” means that this is the measure when—as is very common—each observation carries only one value.

   List of attributes
      These also correspond to **concepts**, but may not be numerical or on a scale of discrete values.
      They may be optional or required.
      For example, a required ``UNIT_MEASURE`` attribute could indicate whether observation values for the primary measure of “vehicle activity” are given in kilometres or miles.

Comments
~~~~~~~~

The SDMX-IM, as above, helps untangle ideas that are often confused for one another:

1. A **data flow** describes a fixed structure. Multiple **data sets** may match this structure; these are all within the data flow.
   For example, a (larger) data set may include data on many countries.
   In response to a request, a user may receive data for only a few countries.
   This user has received “a data set” that is compatible with the same data flow as the “full(er)” data set from which it was excerpted.

   Conversely, multiple sources might provide data for different countries; these will be contained in multiple “data sets” that all fit in the same “data flow”.
   By concatenating or otherwise manipulating these data sets, a person or system may produce a single “data set”, also within the “data flow”, that contains all their observations.

Data provisioning
-----------------

_`Agency`
   SDMX uses this scheme for any organization or entity, even a single person.
   Most can have 1 or more identified **contacts**, who are specific people.

_`Data provider`
   An agency that provides some data or metadata.
   This may not be “their” data: data may be handled by multiple agencies, each receiving it from an **upstream** data provider and passing it to one or more **downstream** consumers.

_`Data source`
   This term is used in two ways.

   In general, it is used to refer to the *furthest upstream* data provider in the chain, though this can be imprecise.

   In SDMX, it also can mean a system (API) operated by a data provider, from which other people or systems can access the (meta)data they provide.

Operations on data
------------------

Terms like “cleaning”, “processing”, and “harmonization” are sometimes used to refer to complicated processes that can involve multiple steps or operations on (meta)data. [#]_
Each operation might be performed by a **person** (“manual”) or **system** (“automated”; or “semi-automated” if the system must be triggered or invoked by a person).

One way (not the only way!) to categorize these operations is to separate those that do not alter observation values from those that do.

Handle data “non-destructively”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

_`Find`, identify
   Data providers and sources are identified.
   Metadata might be collected to describe the data that is available from these providers.

_`Move`
   Data is moved from one place, system, etc. to another.
   This includes:

   _`Upload`
      A person transfers data from their own system to another via an API or web-based system.
   _`Collect`
      A person or system gathers data available from multiple other locations into a single location.

_`Select`
   …a subset of data (observations) from a data set or data flow.

   The selection can be specified in terms of data (key values and observation values) or metadata  (attributes, annotations).

(Re)format, convert
   Without transforming keys or observation values, these can be changed between different file formats and arrangements.
   Examples:

   - Tabular data can be changed between ‘wide’ or ‘long’ layouts.
   - Data from a CSV, OpenDocument, or Excel files can be converted to another format.

Collate
   Observations from multiple data sets/flows are joined into a single data set/flow.

(Re)label
   Dimension or attribute (“column”) IDs, or specific labels/codes appearing in keys or attribute values, are replaced with others; or implicit/missing dimensions and associated key values are added.

   Examples:

   - For a data set which is implicitly for a single geography, a ``GEO`` dimension or attribute is added, and all observations receive the same label (e.g. ``AT``) for this dimension/attribute.
   - Or, data which is labeled with particular/idiosyncratic labels (“S. Korea”, “Cote D'Ivoire”) is relabeled with codes from a target list (“KR”, “CI”).

Transform and create new data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A variety of operations can be applied which result in _altered_ or _new_ observations (the keys/labels and/or observation values may be changed), possibly conforming to a different `DSD`_.

_`Calculate`, arithmetic, statistics
   These are simple mathematical operations applied to single observations (e.g. change the magnitude to a different unit of measurement) or groups of observations (e.g. compute an average or ratio).

_`Aggregate`, _`disaggregate`
   Aggregation reduces the number of labels/codes along one dimension.
   Example: data which are labeled KIND ∈ {APPLE, BANANA, MUSHROOM} can be aggregated to KIND ∈ {FRUIT, VEGETABLE}, by specifying that FRUIT={APPLE, BANANA} and VEGETABLE={MUSHROOM}.
   Commonly the calculation applied is a simple sum, but it may be a weighted sum or something else.

   Disaggregation _increases_ the number of labels/codes along one dimension.
   This operation always involves adding information, in the form of other data points (sometimes call “assumptions”, “shares”, and other terms).
   Example: to disaggregate a count of fruit to counts of apples and bananas, a data point is needed that gives the fraction of all fruit which are apples.

_`Model`
   A **model** is a more complex process of calculation or an algorithm that might include things like optimization, estimation, etc.
   Existing data is provided for the model's required input and assumptions; then the model outputs are new observations in one or more data flows, with their own particular structure.

   Example: a model that simulates vehicle stocks (output) given vehicle sales and some parameters about vehicle lifetime (input and assumptions).

Evaluate data quality
~~~~~~~~~~~~~~~~~~~~~

_`“Data quality”` is an umbrella term for many kinds of criteria used to evaluate or judge data *and* the results of these evaluations.
Most people are familiar with the distinction between `accuracy and precision <https://en.wikipedia.org/wiki/Accuracy_and_precision>`_.
These are two different criteria of the quality of data (specifically: measurement data): it is possible for data to be accurate yet not precise; precise yet not accurate; neither; or both.
Extending this notion from two to many, we can understand that “data quality” is multifaceted, and there are dozens of criteria that may potentially be applied in any situation.

Data quality criteria can be informal, or highly systematized:

- A data consumer says, “I've had trouble with other data from that Source X in the past; I expect this data is of low quality.”
- A scientific method, calculations, etc. are applied to some data to produce a (quantitative) **metric**: another data point, or points.
  These are then compared to reference or threshold values to indicate whether the data quality is low, or high, or passes the criterion.

Each of these may be valid and important in different circumstances, for different stakeholders.

There are thus two broad categories of (meta)data operations:

Apply one (atomic) data quality criterion
   Examples:

   - Compute a metric and compare it to a reference value.
   - Check the identity of the data provider against a list of approved data providers.
   - Check the date of data collection against a target date.

Combine criteria
   Example: all observations that meet every one from a specific list of *N* criteria are marked with an attribute or annotation like QUALITY=PASS; others are marked FAIL.

   This creates new metadata that can then be used by a `select`_ operation.

Comments
~~~~~~~~

Individual (atomic, simple) operations can be combined into more complicated or complex processes, sometimes called **workflows**, **pipelines**, etc.
When we say “the data were cleaned,” we are usually referring to a *specific workflow* applied in a *specific context* to handle data from *specific sources* and produce data that meet *specific quality criteria*.

Because the TDC must handle data from multiple sources, in multiple contexts, and provide multiple data products that meet different quality criteria, it is crucial to explicitly list the steps in these workflows, and identify which ones are common to/reusable in multiple workflows.

Data systems archetypes and processes
-------------------------------------

[data] Catalogue
   A catalogue is a *listing of items* (`Wiktionary <https://en.wiktionary.org/wiki/catalogue#Noun>`__).
   This may be distinct from the items themselves; e.g. a library catalogue will tell you things about the items, including where they can be found, but the items are not *in* the catalogue.

   A data catalogue is a system for handling metadata.
   It may not handle actual data at all; or may handle it directly or through a connection to a distinct system for handling data.

[Data] Lake
   A repository of data stored in natural/raw formats (`Wikipedia <https://en.wikipedia.org/wiki/Data_lake>`_).
   This generally means that the items are stored collectively, even if those natural/raw formats are very heterogeneous—in the same way that many objects may be thrown into a lake without altering their form.

Harmonized data, data harmonization
   (Meta)data—or a process or workflow to produce it—that meets certain quality criteria in terms of “harmony”.

   This can include:
   - Consistent or common data structure and metadata.
   - Differences in measures or definitions across sources are transformed into a common value.

   Example: Data from Source A and Source B both include data on the measure of “private vehicle ownership”. However:

   - Source A uses ISO 3166 alpha-3 codes for a COUNTRY dimension; Source B uses its own idiosyncratic list of names in a REGION dimension.
   - Source A observation values are expressed in number of vehicles per thousand persons in the total population.
     In Source B, the denominator is thousands of persons aged 15 years or older.
   - Source B includes two- and three-wheel motor vehicles; Source A includes only 4-wheel light duty vehicles.

   To produce harmonized data, a workflow might involve the following operations:

   1. **Collect** data.
   2. **Collect** metadata.
   3. **Reformat** data from each source into a common format
   4. **Add metadata** missing from the source data.
   5. **Relabel** both data sets to a ``GEO`` dimension using ISO 3166 alpha-2 codes.
   6. **Fill** missing observations in one or both data sets.
   7. **Calculate** new observation values for Source A using additional data on the share of the population aged 15 or older.
   8. **Calculate** new observation values for Source B using additional data on the relative stocks of 2/3W versus 4W vehicles.
   9. **Annotate** the individual observations or series to record the processing steps applied.
   10. **Collate** the two data sets into a single data flow.
   11. **Apply** multiple data quality criteria, storing the results as additional metadata (for later use by a person or system).

   Some observations:

   - Some of these steps must occur in specific order; others are flexible.
     For example, step (6) (“Fill…”) could also take place after step (8).
   - Steps (7) and (8) rely on prior decisions about the **target data structure** for the harmonization process.
     In this case, the specific target measure is not provided by *either* Source A or Source B; both must be transformed, but in different ways.
   - Suppose that over time Source B drops their idiosyncratic REGION labels and instead labels their data with ``GEO`` and ISO 3166 alpha-2 codes—the same as targeted by the harmonization process.
     Then step (5) becomes a **no-op(eration)** for Source B: the source data is already in the target format.

TDC processes
=============

To be added.


Footnotes

.. [#] by “(meta)data” we mean that these operations can act on data only; on metadata only; or on data and metadata together.
   For example, metadata can be moved on its own, without any data being moved.
