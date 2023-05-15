Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF35C7EE24
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 18:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 844FEC4339B; Mon, 15 May 2023 18:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A23C433EF
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684175585;
	bh=+mak4Kx8fVtnmaIatb8I/vFYA4iKUJTQs5r+Ex6vE5o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=I5ODoOs+w2fZPy+wNUzLVg4YWXUNoGFbE5vc9kPgled2pEqUimPHyEcT1UPqOnCCL
	 mzGJzShRgaIXDTXt9/aUGczGJ92oihG0sWLVLcfClQX+Z1db9hMBZJCmFVeLIsvFo4
	 OCohho+Pbg1fDtipW7np64Pd/ZOyDe267esPIIUhogeT35rdV6ZdJ3Pg9BLHNKPsA7
	 qF6qtFwwGHMWJB1NFZsJuM1tfP77r+pbrWmHEx2FLkEc5zCAdJfYd/RO1QEPumV8Ap
	 w4zCP6g8OZLIAp5+AQP0nLdsUr//rMHkahfRAQKGivZyPhamoEpVJKxyGuBGj9spn4
	 ty/lsL0LJthNg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so17062134276.3
        for <linux-firmware@kernel.org>; Mon, 15 May 2023 11:33:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDz3NlRodVEHRR6zPLMPTxzOaHvhsxKeYh9P3E7dvV1yDqSiCJ4I
	9Az0IKmAgRepIFywWZyHDJMqoCLA268sMBbZ/bs=
X-Google-Smtp-Source: ACHHUZ6DVlx0EPwHmLsfKhbHJ/y+OinPXNtOZwE+OSaz1QLMf2W5KDIOZJ8oZTH/eq2FWB315baTABInvRUc6cibom4=
X-Received: by 2002:a25:5096:0:b0:ba7:9055:6112 with SMTP id
 e144-20020a255096000000b00ba790556112mr6262211ybb.35.1684175583858; Mon, 15
 May 2023 11:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230510003751.84732-1-bryanhundven@gmail.com>
In-Reply-To: <20230510003751.84732-1-bryanhundven@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 May 2023 14:32:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6kfsYYf5NNGnHqpdbP_T7m7TYL-QYZvdi-+qM7EAB6DQ@mail.gmail.com>
Message-ID: <CA+5PVA6kfsYYf5NNGnHqpdbP_T7m7TYL-QYZvdi-+qM7EAB6DQ@mail.gmail.com>
Subject: Re: [PATCH] Clean up check_whence.py style
To: Bryan Hundven <bryanhundven@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 8:38=E2=80=AFPM Bryan Hundven <bryanhundven@gmail.co=
m> wrote:
>
> Use flake8, pylint, and black to clean up python code style for
> check_whence.py and potentially any future python scripts.
>
> Signed-off-by: Bryan Hundven <bryanhundven@gmail.com>

Ironically, this patch actually causes check_whence.py to fail after
it is applied.

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: .flake8 not listed in WHENCE
E: .pylintrc not listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you fix this up?

josh

> ---
>  .flake8         |   2 +
>  .pylintrc       | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>  check_whence.py |  84 ++++---
>  3 files changed, 689 insertions(+), 27 deletions(-)
>  create mode 100644 .flake8
>  create mode 100644 .pylintrc
>
> diff --git a/.flake8 b/.flake8
> new file mode 100644
> index 0000000..7da1f96
> --- /dev/null
> +++ b/.flake8
> @@ -0,0 +1,2 @@
> +[flake8]
> +max-line-length =3D 100
> diff --git a/.pylintrc b/.pylintrc
> new file mode 100644
> index 0000000..202ec02
> --- /dev/null
> +++ b/.pylintrc
> @@ -0,0 +1,630 @@
> +[MAIN]
> +
> +# Analyse import fallback blocks. This can be used to support both Pytho=
n 2 and
> +# 3 compatible code, which means that the block might have code that exi=
sts
> +# only in one or another interpreter, leading to false positives when an=
alysed.
> +analyse-fallback-blocks=3Dno
> +
> +# Clear in-memory caches upon conclusion of linting. Useful if running p=
ylint
> +# in a server-like mode.
> +clear-cache-post-run=3Dno
> +
> +# Load and enable all available extensions. Use --list-extensions to see=
 a list
> +# all available extensions.
> +#enable-all-extensions=3D
> +
> +# In error mode, messages with a category besides ERROR or FATAL are
> +# suppressed, and no reports are done by default. Error mode is compatib=
le with
> +# disabling specific errors.
> +#errors-only=3D
> +
> +# Always return a 0 (non-error) status code, even if lint errors are fou=
nd.
> +# This is primarily useful in continuous integration scripts.
> +#exit-zero=3D
> +
> +# A comma-separated list of package or module names from where C extensi=
ons may
> +# be loaded. Extensions are loading into the active Python interpreter a=
nd may
> +# run arbitrary code.
> +extension-pkg-allow-list=3D
> +
> +# A comma-separated list of package or module names from where C extensi=
ons may
> +# be loaded. Extensions are loading into the active Python interpreter a=
nd may
> +# run arbitrary code. (This is an alternative name to extension-pkg-allo=
w-list
> +# for backward compatibility.)
> +extension-pkg-whitelist=3D
> +
> +# Return non-zero exit code if any of these messages/categories are dete=
cted,
> +# even if score is above --fail-under value. Syntax same as enable. Mess=
ages
> +# specified are enabled, while categories only check already-enabled mes=
sages.
> +fail-on=3D
> +
> +# Specify a score threshold under which the program will exit with error=
.
> +fail-under=3D10
> +
> +# Interpret the stdin as a python script, whose filename needs to be pas=
sed as
> +# the module_or_package argument.
> +#from-stdin=3D
> +
> +# Files or directories to be skipped. They should be base names, not pat=
hs.
> +ignore=3DCVS
> +
> +# Add files or directories matching the regular expressions patterns to =
the
> +# ignore-list. The regex matches against paths and can be in Posix or Wi=
ndows
> +# format. Because '\\' represents the directory delimiter on Windows sys=
tems,
> +# it can't be used as an escape character.
> +ignore-paths=3D
> +
> +# Files or directories matching the regular expression patterns are skip=
ped.
> +# The regex matches against base names, not paths. The default value ign=
ores
> +# Emacs file locks
> +ignore-patterns=3D^\.#
> +
> +# List of module names for which member attributes should not be checked
> +# (useful for modules/projects where namespaces are manipulated during r=
untime
> +# and thus existing member attributes cannot be deduced by static analys=
is). It
> +# supports qualified module names, as well as Unix pattern matching.
> +ignored-modules=3D
> +
> +# Python code to execute, usually for sys.path manipulation such as
> +# pygtk.require().
> +#init-hook=3D
> +
> +# Use multiple processes to speed up Pylint. Specifying 0 will auto-dete=
ct the
> +# number of processors available to use, and will cap the count on Windo=
ws to
> +# avoid hangs.
> +jobs=3D1
> +
> +# Control the amount of potential inferred values when inferring a singl=
e
> +# object. This can help the performance when dealing with large function=
s or
> +# complex, nested conditions.
> +limit-inference-results=3D100
> +
> +# List of plugins (as comma separated values of python module names) to =
load,
> +# usually to register additional checkers.
> +load-plugins=3D
> +
> +# Pickle collected data for later comparisons.
> +persistent=3Dyes
> +
> +# Minimum Python version to use for version dependent checks. Will defau=
lt to
> +# the version used to run pylint.
> +py-version=3D3.11
> +
> +# Discover python modules and packages in the file system subtree.
> +recursive=3Dno
> +
> +# Add paths to the list of the source roots. Supports globbing patterns.=
 The
> +# source root is an absolute path or a path relative to the current work=
ing
> +# directory used to determine a package namespace for modules located un=
der the
> +# source root.
> +source-roots=3D
> +
> +# When enabled, pylint would attempt to guess common misconfiguration an=
d emit
> +# user-friendly hints instead of false-positive error messages.
> +suggestion-mode=3Dyes
> +
> +# Allow loading of arbitrary C extensions. Extensions are imported into =
the
> +# active Python interpreter and may run arbitrary code.
> +unsafe-load-any-extension=3Dno
> +
> +# In verbose mode, extra non-checker-related info will be displayed.
> +#verbose=3D
> +
> +
> +[BASIC]
> +
> +# Naming style matching correct argument names.
> +argument-naming-style=3Dsnake_case
> +
> +# Regular expression matching correct argument names. Overrides argument=
-
> +# naming-style. If left empty, argument names will be checked with the s=
et
> +# naming style.
> +#argument-rgx=3D
> +
> +# Naming style matching correct attribute names.
> +attr-naming-style=3Dsnake_case
> +
> +# Regular expression matching correct attribute names. Overrides attr-na=
ming-
> +# style. If left empty, attribute names will be checked with the set nam=
ing
> +# style.
> +#attr-rgx=3D
> +
> +# Bad variable names which should always be refused, separated by a comm=
a.
> +bad-names=3Dfoo,
> +          bar,
> +          baz,
> +          toto,
> +          tutu,
> +          tata
> +
> +# Bad variable names regexes, separated by a comma. If names match any r=
egex,
> +# they will always be refused
> +bad-names-rgxs=3D
> +
> +# Naming style matching correct class attribute names.
> +class-attribute-naming-style=3Dany
> +
> +# Regular expression matching correct class attribute names. Overrides c=
lass-
> +# attribute-naming-style. If left empty, class attribute names will be c=
hecked
> +# with the set naming style.
> +#class-attribute-rgx=3D
> +
> +# Naming style matching correct class constant names.
> +class-const-naming-style=3DUPPER_CASE
> +
> +# Regular expression matching correct class constant names. Overrides cl=
ass-
> +# const-naming-style. If left empty, class constant names will be checke=
d with
> +# the set naming style.
> +#class-const-rgx=3D
> +
> +# Naming style matching correct class names.
> +class-naming-style=3DPascalCase
> +
> +# Regular expression matching correct class names. Overrides class-namin=
g-
> +# style. If left empty, class names will be checked with the set naming =
style.
> +#class-rgx=3D
> +
> +# Naming style matching correct constant names.
> +const-naming-style=3DUPPER_CASE
> +
> +# Regular expression matching correct constant names. Overrides const-na=
ming-
> +# style. If left empty, constant names will be checked with the set nami=
ng
> +# style.
> +#const-rgx=3D
> +
> +# Minimum line length for functions/classes that require docstrings, sho=
rter
> +# ones are exempt.
> +docstring-min-length=3D-1
> +
> +# Naming style matching correct function names.
> +function-naming-style=3Dsnake_case
> +
> +# Regular expression matching correct function names. Overrides function=
-
> +# naming-style. If left empty, function names will be checked with the s=
et
> +# naming style.
> +#function-rgx=3D
> +
> +# Good variable names which should always be accepted, separated by a co=
mma.
> +good-names=3Di,
> +           j,
> +           k,
> +           ex,
> +           Run,
> +           _
> +
> +# Good variable names regexes, separated by a comma. If names match any =
regex,
> +# they will always be accepted
> +good-names-rgxs=3D
> +
> +# Include a hint for the correct naming format with invalid-name.
> +include-naming-hint=3Dno
> +
> +# Naming style matching correct inline iteration names.
> +inlinevar-naming-style=3Dany
> +
> +# Regular expression matching correct inline iteration names. Overrides
> +# inlinevar-naming-style. If left empty, inline iteration names will be =
checked
> +# with the set naming style.
> +#inlinevar-rgx=3D
> +
> +# Naming style matching correct method names.
> +method-naming-style=3Dsnake_case
> +
> +# Regular expression matching correct method names. Overrides method-nam=
ing-
> +# style. If left empty, method names will be checked with the set naming=
 style.
> +#method-rgx=3D
> +
> +# Naming style matching correct module names.
> +module-naming-style=3Dsnake_case
> +
> +# Regular expression matching correct module names. Overrides module-nam=
ing-
> +# style. If left empty, module names will be checked with the set naming=
 style.
> +#module-rgx=3D
> +
> +# Colon-delimited sets of names that determine each other's naming style=
 when
> +# the name regexes allow several styles.
> +name-group=3D
> +
> +# Regular expression which should only match function or class names tha=
t do
> +# not require a docstring.
> +no-docstring-rgx=3D^_
> +
> +# List of decorators that produce properties, such as abc.abstractproper=
ty. Add
> +# to this list to register other decorators that produce valid propertie=
s.
> +# These decorators are taken in consideration only for invalid-name.
> +property-classes=3Dabc.abstractproperty
> +
> +# Regular expression matching correct type alias names. If left empty, t=
ype
> +# alias names will be checked with the set naming style.
> +#typealias-rgx=3D
> +
> +# Regular expression matching correct type variable names. If left empty=
, type
> +# variable names will be checked with the set naming style.
> +#typevar-rgx=3D
> +
> +# Naming style matching correct variable names.
> +variable-naming-style=3Dsnake_case
> +
> +# Regular expression matching correct variable names. Overrides variable=
-
> +# naming-style. If left empty, variable names will be checked with the s=
et
> +# naming style.
> +#variable-rgx=3D
> +
> +
> +[CLASSES]
> +
> +# Warn about protected attribute access inside special methods
> +check-protected-access-in-special-methods=3Dno
> +
> +# List of method names used to declare (i.e. assign) instance attributes=
.
> +defining-attr-methods=3D__init__,
> +                      __new__,
> +                      setUp,
> +                      __post_init__
> +
> +# List of member names, which should be excluded from the protected acce=
ss
> +# warning.
> +exclude-protected=3D_asdict,_fields,_replace,_source,_make,os._exit
> +
> +# List of valid names for the first argument in a class method.
> +valid-classmethod-first-arg=3Dcls
> +
> +# List of valid names for the first argument in a metaclass class method=
.
> +valid-metaclass-classmethod-first-arg=3Dmcs
> +
> +
> +[DESIGN]
> +
> +# List of regular expressions of class ancestor names to ignore when cou=
nting
> +# public methods (see R0903)
> +exclude-too-few-public-methods=3D
> +
> +# List of qualified class names to ignore when counting class parents (s=
ee
> +# R0901)
> +ignored-parents=3D
> +
> +# Maximum number of arguments for function / method.
> +max-args=3D5
> +
> +# Maximum number of attributes for a class (see R0902).
> +max-attributes=3D7
> +
> +# Maximum number of boolean expressions in an if statement (see R0916).
> +max-bool-expr=3D5
> +
> +# Maximum number of branch for function / method body.
> +max-branches=3D12
> +
> +# Maximum number of locals for function / method body.
> +max-locals=3D15
> +
> +# Maximum number of parents for a class (see R0901).
> +max-parents=3D7
> +
> +# Maximum number of public methods for a class (see R0904).
> +max-public-methods=3D20
> +
> +# Maximum number of return / yield for function / method body.
> +max-returns=3D6
> +
> +# Maximum number of statements in function / method body.
> +max-statements=3D50
> +
> +# Minimum number of public methods for a class (see R0903).
> +min-public-methods=3D2
> +
> +
> +[EXCEPTIONS]
> +
> +# Exceptions that will emit a warning when caught.
> +overgeneral-exceptions=3Dbuiltins.BaseException,builtins.Exception
> +
> +
> +[FORMAT]
> +
> +# Expected format of line ending, e.g. empty (any line ending), LF or CR=
LF.
> +expected-line-ending-format=3D
> +
> +# Regexp for a line that is allowed to be longer than the limit.
> +ignore-long-lines=3D^\s*(# )?<?https?://\S+>?$
> +
> +# Number of spaces of indent required inside a hanging or continued line=
.
> +indent-after-paren=3D4
> +
> +# String used as indentation unit. This is usually "    " (4 spaces) or =
"\t" (1
> +# tab).
> +indent-string=3D'    '
> +
> +# Maximum number of characters on a single line.
> +max-line-length=3D100
> +
> +# Maximum number of lines in a module.
> +max-module-lines=3D1000
> +
> +# Allow the body of a class to be on the same line as the declaration if=
 body
> +# contains single statement.
> +single-line-class-stmt=3Dno
> +
> +# Allow the body of an if to be on the same line as the test if there is=
 no
> +# else.
> +single-line-if-stmt=3Dno
> +
> +
> +[IMPORTS]
> +
> +# List of modules that can be imported at any level, not just the top le=
vel
> +# one.
> +allow-any-import-level=3D
> +
> +# Allow explicit reexports by alias from a package __init__.
> +allow-reexport-from-package=3Dno
> +
> +# Allow wildcard imports from modules that define __all__.
> +allow-wildcard-with-all=3Dno
> +
> +# Deprecated modules which should not be used, separated by a comma.
> +deprecated-modules=3D
> +
> +# Output a graph (.gv or any supported image format) of external depende=
ncies
> +# to the given file (report RP0402 must not be disabled).
> +ext-import-graph=3D
> +
> +# Output a graph (.gv or any supported image format) of all (i.e. intern=
al and
> +# external) dependencies to the given file (report RP0402 must not be
> +# disabled).
> +import-graph=3D
> +
> +# Output a graph (.gv or any supported image format) of internal depende=
ncies
> +# to the given file (report RP0402 must not be disabled).
> +int-import-graph=3D
> +
> +# Force import order to recognize a module as part of the standard
> +# compatibility libraries.
> +known-standard-library=3D
> +
> +# Force import order to recognize a module as part of a third party libr=
ary.
> +known-third-party=3Denchant
> +
> +# Couples of modules and preferred modules, separated by a comma.
> +preferred-modules=3D
> +
> +
> +[LOGGING]
> +
> +# The type of string formatting that logging methods do. `old` means usi=
ng %
> +# formatting, `new` is for `{}` formatting.
> +logging-format-style=3Dold
> +
> +# Logging modules to check that the string format arguments are in loggi=
ng
> +# function parameter format.
> +logging-modules=3Dlogging
> +
> +
> +[MESSAGES CONTROL]
> +
> +# Only show warnings with the listed confidence levels. Leave empty to s=
how
> +# all. Valid levels: HIGH, CONTROL_FLOW, INFERENCE, INFERENCE_FAILURE,
> +# UNDEFINED.
> +confidence=3DHIGH,
> +           CONTROL_FLOW,
> +           INFERENCE,
> +           INFERENCE_FAILURE,
> +           UNDEFINED
> +
> +# Disable the message, report, category or checker with the given id(s).=
 You
> +# can either give multiple identifiers separated by comma (,) or put thi=
s
> +# option multiple times (only on the command line, not in the configurat=
ion
> +# file where it should appear only once). You can also use "--disable=3D=
all" to
> +# disable everything first and then re-enable specific checks. For examp=
le, if
> +# you want to run only the similarities checker, you can use "--disable=
=3Dall
> +# --enable=3Dsimilarities". If you want to run only the classes checker,=
 but have
> +# no Warning level messages displayed, use "--disable=3Dall --enable=3Dc=
lasses
> +# --disable=3DW".
> +disable=3Draw-checker-failed,
> +        bad-inline-option,
> +        locally-disabled,
> +        file-ignored,
> +        suppressed-message,
> +        useless-suppression,
> +        deprecated-pragma,
> +        use-symbolic-message-instead
> +
> +# Enable the message, report, category or checker with the given id(s). =
You can
> +# either give multiple identifier separated by comma (,) or put this opt=
ion
> +# multiple time (only on the command line, not in the configuration file=
 where
> +# it should appear only once). See also the "--disable" option for examp=
les.
> +enable=3Dc-extension-no-member
> +
> +
> +[METHOD_ARGS]
> +
> +# List of qualified names (i.e., library.method) which require a timeout
> +# parameter e.g. 'requests.api.get,requests.api.post'
> +timeout-methods=3Drequests.api.delete,requests.api.get,requests.api.head=
,requests.api.options,requests.api.patch,requests.api.post,requests.api.put=
,requests.api.request
> +
> +
> +[MISCELLANEOUS]
> +
> +# List of note tags to take in consideration, separated by a comma.
> +notes=3DFIXME,
> +      XXX,
> +      TODO
> +
> +# Regular expression of note tags to take in consideration.
> +notes-rgx=3D
> +
> +
> +[REFACTORING]
> +
> +# Maximum number of nested blocks for function / method body
> +max-nested-blocks=3D5
> +
> +# Complete name of functions that never returns. When checking for
> +# inconsistent-return-statements if a never returning function is called=
 then
> +# it will be considered as an explicit return statement and no message w=
ill be
> +# printed.
> +never-returning-functions=3Dsys.exit,argparse.parse_error
> +
> +
> +[REPORTS]
> +
> +# Python expression which should return a score less than or equal to 10=
. You
> +# have access to the variables 'fatal', 'error', 'warning', 'refactor',
> +# 'convention', and 'info' which contain the number of messages in each
> +# category, as well as 'statement' which is the total number of statemen=
ts
> +# analyzed. This score is used by the global evaluation report (RP0004).
> +evaluation=3Dmax(0, 0 if fatal else 10.0 - ((float(5 * error + warning +=
 refactor + convention) / statement) * 10))
> +
> +# Template used to display messages. This is a python new-style format s=
tring
> +# used to format the message information. See doc for all details.
> +msg-template=3D
> +
> +# Set the output format. Available formats are text, parseable, colorize=
d, json
> +# and msvs (visual studio). You can also give a reporter class, e.g.
> +# mypackage.mymodule.MyReporterClass.
> +#output-format=3D
> +
> +# Tells whether to display a full report or only the messages.
> +reports=3Dno
> +
> +# Activate the evaluation score.
> +score=3Dyes
> +
> +
> +[SIMILARITIES]
> +
> +# Comments are removed from the similarity computation
> +ignore-comments=3Dyes
> +
> +# Docstrings are removed from the similarity computation
> +ignore-docstrings=3Dyes
> +
> +# Imports are removed from the similarity computation
> +ignore-imports=3Dyes
> +
> +# Signatures are removed from the similarity computation
> +ignore-signatures=3Dyes
> +
> +# Minimum lines number of a similarity.
> +min-similarity-lines=3D4
> +
> +
> +[SPELLING]
> +
> +# Limits count of emitted suggestions for spelling mistakes.
> +max-spelling-suggestions=3D4
> +
> +# Spelling dictionary name. No available dictionaries : You need to inst=
all
> +# both the python package and the system dependency for enchant to work.=
.
> +spelling-dict=3D
> +
> +# List of comma separated words that should be considered directives if =
they
> +# appear at the beginning of a comment and should not be checked.
> +spelling-ignore-comment-directives=3Dfmt: on,fmt: off,noqa:,noqa,nosec,i=
sort:skip,mypy:
> +
> +# List of comma separated words that should not be checked.
> +spelling-ignore-words=3D
> +
> +# A path to a file that contains the private dictionary; one word per li=
ne.
> +spelling-private-dict-file=3D
> +
> +# Tells whether to store unknown words to the private dictionary (see th=
e
> +# --spelling-private-dict-file option) instead of raising a message.
> +spelling-store-unknown-words=3Dno
> +
> +
> +[STRING]
> +
> +# This flag controls whether inconsistent-quotes generates a warning whe=
n the
> +# character used as a quote delimiter is used inconsistently within a mo=
dule.
> +check-quote-consistency=3Dno
> +
> +# This flag controls whether the implicit-str-concat should generate a w=
arning
> +# on implicit string concatenation in sequences defined over several lin=
es.
> +check-str-concat-over-line-jumps=3Dno
> +
> +
> +[TYPECHECK]
> +
> +# List of decorators that produce context managers, such as
> +# contextlib.contextmanager. Add to this list to register other decorato=
rs that
> +# produce valid context managers.
> +contextmanager-decorators=3Dcontextlib.contextmanager
> +
> +# List of members which are set dynamically and missed by pylint inferen=
ce
> +# system, and so shouldn't trigger E1101 when accessed. Python regular
> +# expressions are accepted.
> +generated-members=3D
> +
> +# Tells whether to warn about missing members when the owner of the attr=
ibute
> +# is inferred to be None.
> +ignore-none=3Dyes
> +
> +# This flag controls whether pylint should warn about no-member and simi=
lar
> +# checks whenever an opaque object is returned when inferring. The infer=
ence
> +# can return multiple potential results while evaluating a Python object=
, but
> +# some branches might not be evaluated, which results in partial inferen=
ce. In
> +# that case, it might be useful to still emit no-member and other checks=
 for
> +# the rest of the inferred objects.
> +ignore-on-opaque-inference=3Dyes
> +
> +# List of symbolic message names to ignore for Mixin members.
> +ignored-checks-for-mixins=3Dno-member,
> +                          not-async-context-manager,
> +                          not-context-manager,
> +                          attribute-defined-outside-init
> +
> +# List of class names for which member attributes should not be checked =
(useful
> +# for classes with dynamically set attributes). This supports the use of
> +# qualified names.
> +ignored-classes=3Doptparse.Values,thread._local,_thread._local,argparse.=
Namespace
> +
> +# Show a hint with possible names when a member name was not found. The =
aspect
> +# of finding the hint is based on edit distance.
> +missing-member-hint=3Dyes
> +
> +# The minimum edit distance a name should have in order to be considered=
 a
> +# similar match for a missing member name.
> +missing-member-hint-distance=3D1
> +
> +# The total number of similar names that should be taken in consideratio=
n when
> +# showing a hint for a missing member.
> +missing-member-max-choices=3D1
> +
> +# Regex pattern to define which classes are considered mixins.
> +mixin-class-rgx=3D.*[Mm]ixin
> +
> +# List of decorators that change the signature of a decorated function.
> +signature-mutators=3D
> +
> +
> +[VARIABLES]
> +
> +# List of additional names supposed to be defined in builtins. Remember =
that
> +# you should avoid defining new builtins when possible.
> +additional-builtins=3D
> +
> +# Tells whether unused global variables should be treated as a violation=
.
> +allow-global-unused-variables=3Dyes
> +
> +# List of names allowed to shadow builtins
> +allowed-redefined-builtins=3D
> +
> +# List of strings which can identify a callback function by name. A call=
back
> +# name must start or end with one of those strings.
> +callbacks=3Dcb_,
> +          _cb
> +
> +# A regular expression matching the name of dummy variables (i.e. expect=
ed to
> +# not be used).
> +dummy-variables-rgx=3D_+$|(_[a-zA-Z0-9_]*[a-zA-Z0-9]+?$)|dummy|^ignored_=
|^unused_
> +
> +# Argument names that match this expression will be ignored.
> +ignored-argument-names=3D_.*|^ignored_|^unused_
> +
> +# Tells whether we should check for unused import in __init__ files.
> +init-import=3Dno
> +
> +# List of qualified module names which can have objects that can redefin=
e
> +# builtins.
> +redefining-builtins-modules=3Dsix.moves,past.builtins,future.builtins,bu=
iltins,io
> diff --git a/check_whence.py b/check_whence.py
> index 711be36..4dfda90 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -1,73 +1,102 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
> +""" check_whence """
>
> -import os, re, sys
> +import os
> +import re
> +import sys
>  from io import open
>
> +
>  def list_whence():
> -    with open('WHENCE', encoding=3D'utf-8') as whence:
> +    """
> +    list_whence
> +    """
> +    with open("WHENCE", encoding=3D"utf-8") as whence:
>          for line in whence:
>              match =3D re.match(r'(?:File|Source):\s*"(.*)"', line)
>              if match:
>                  yield match.group(1)
>                  continue
> -            match =3D re.match(r'(?:File|Source):\s*(\S*)', line)
> +            match =3D re.match(r"(?:File|Source):\s*(\S*)", line)
>              if match:
>                  yield match.group(1)
>                  continue
> -            match =3D re.match(r'Licen[cs]e: (?:.*\bSee (.*) for details=
\.?|(\S*))\n',
> -                             line)
> +            match =3D re.match(
> +                r"Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n", =
line
> +            )
>              if match:
>                  if match.group(1):
> -                    for name in re.split(r', | and ', match.group(1)):
> +                    for name in re.split(r", | and ", match.group(1)):
>                          yield name
>                      continue
>                  if match.group(2):
>                      # Just one word - may or may not be a filename
> -                    if not re.search(r'unknown|distributable', match.gro=
up(2),
> -                                     re.IGNORECASE):
> +                    if not re.search(
> +                        r"unknown|distributable", match.group(2), re.IGN=
ORECASE
> +                    ):
>                          yield match.group(2)
>                          continue
>
> +
>  def list_whence_files():
> -    with open('WHENCE', encoding=3D'utf-8') as whence:
> +    """
> +    list_whence_files
> +    """
> +    with open("WHENCE", encoding=3D"utf-8") as whence:
>          for line in whence:
> -            match =3D re.match(r'File:\s*(.*)', line)
> +            match =3D re.match(r"File:\s*(.*)", line)
>              if match:
> -                yield match.group(1).replace("\ ", " ")
> +                yield match.group(1).replace(r"\ ", " ")
>                  continue
>
> +
>  def list_git():
> -    with os.popen('git ls-files') as git_files:
> +    """
> +    list_git
> +    """
> +    with os.popen("git ls-files") as git_files:
>          for line in git_files:
> -            yield line.rstrip('\n')
> +            yield line.rstrip("\n")
> +
>
>  def main():
> +    """
> +    main
> +    """
>      ret =3D 0
>      whence_list =3D list(list_whence())
>      whence_files =3D list(list_whence_files())
> -    known_files =3D set(name for name in whence_list if not name.endswit=
h('/')) | \
> -                  set(['check_whence.py', 'configure', 'Makefile',
> -                       'README', 'copy-firmware.sh', 'WHENCE'])
> -    known_prefixes =3D set(name for name in whence_list if name.endswith=
('/'))
> +    # pylint: disable-next=3Dline-too-long
> +    known_files =3D set(name for name in whence_list if not name.endswit=
h("/")) | set(
> +        [
> +            "check_whence.py",
> +            "configure",
> +            "Makefile",
> +            "README",
> +            "copy-firmware.sh",
> +            "WHENCE",
> +        ]
> +    )
> +    known_prefixes =3D set(name for name in whence_list if name.endswith=
("/"))
>      git_files =3D set(list_git())
>
> -    for name in set(name for name in whence_files if name.endswith('/'))=
:
> -        sys.stderr.write('E: %s listed in WHENCE as File, but is directo=
ry\n' %
> -                         name)
> +    for name in set(name for name in whence_files if name.endswith("/"))=
:
> +        sys.stderr.write(f"E: {name} listed in WHENCE as File, but is di=
rectory\n")
>          ret =3D 1
>
>      for name in set(fw for fw in whence_files if whence_files.count(fw) =
> 1):
> -        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
> +        sys.stderr.write(f"E: {name} listed in WHENCE twice\n")
>          ret =3D 1
>
>      for name in sorted(list(known_files - git_files)):
> -        sys.stderr.write('E: %s listed in WHENCE does not exist\n' % nam=
e)
> +        sys.stderr.write(f"E: {name} listed in WHENCE does not exist\n" =
% name)
>          ret =3D 1
>
>      for name in sorted(list(git_files - known_files)):
>          # Ignore subdirectory changelogs and GPG detached signatures
> -        if (name.endswith('/ChangeLog') or
> -            (name.endswith('.asc') and name[:-4] in known_files)):
> +        if name.endswith("/ChangeLog") or (
> +            name.endswith(".asc") and name[:-4] in known_files
> +        ):
>              continue
>
>          # Ignore unknown files in known directories
> @@ -75,9 +104,10 @@ def main():
>              if name.startswith(prefix):
>                  break
>          else:
> -            sys.stderr.write('E: %s not listed in WHENCE\n' % name)
> +            sys.stderr.write(f"E: {name} not listed in WHENCE\n")
>              ret =3D 1
>      return ret
>
> -if __name__ =3D=3D '__main__':
> +
> +if __name__ =3D=3D "__main__":
>      sys.exit(main())
> --
> 2.40.1
>
