Return-Path: <SRS0=xk+R=BE=gmail.com=bryanhundven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C65DC77B7D
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 21:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3334CC433EF; Mon, 15 May 2023 21:12:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C784C433D2;
	Mon, 15 May 2023 21:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C784C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f14ec8d72aso13281739e87.1;
        Mon, 15 May 2023 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684185168; x=1686777168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oH108Z8xNSu/MgmUJncs6jFAtX6B3zS2U0cAxVhwJAM=;
        b=ohJ0eAxeucmMwfySY5wqY5RoKtexlW6bL4TAew/byfqDHNjUVRyYptM8RCkRFsgjRh
         klHdxuqdjFQktNkLgLaGoNRpCJBOa89kvj7qyq8Otqjaok5jOxw7I45CAMJzNciGjPrm
         DTMPD0IQLdHkhdO3NEpCmUKhtrbzjJtHCS+k/owxlDrhL5I8/gwAM4T0kmnQJ1ZWDU4t
         Mwvf1CPhiSNRw9r11+/cIzyWUxtt/n5YDsOC4gHLP/WeBT+QOInYU1JpeLKR0CLrY1Kj
         H+VZaleMAYI6I7v1mo0sh00Qn26NUOTQdEH1l0LKSCbLgIVGryhhfrQXvfzcAjJ7jcXl
         2iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684185168; x=1686777168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH108Z8xNSu/MgmUJncs6jFAtX6B3zS2U0cAxVhwJAM=;
        b=Ecy2jmmm99JYWLxVpACQUYUvHoPAgshYIWtzj1xSxR0OMXeR9QQEHD0TgO/M76Ufzf
         EfvbEDR10BXlsDEUu1UT8FfyOMwA8F8vucBg3eAF4fbsp37STonFgWM3zgtU08XP13sM
         +VZZ3YjLiIypxtzFAHOvAjA8blR1hLlys5vy8uKpGYFR/i0MG+G+3M/tP8MMS9Luc7OA
         3gR2YRxw4vFeZFKrs3Cu9KeBZtDO9Tbh2iZp3bFgPI0e8U8v9tUqNDzZMvdIcqh6B5sC
         69pGlwJegijMO9+pF+iggV4DRKCloCiU+IialVM9vefpj+P9+kIWibKyE0t26o5yFCVi
         rrqA==
X-Gm-Message-State: AC+VfDx1hPbjWgoYu1EchiKWBG0O8qVzhX8Xr2GV9g1wG7/xEi2OhuN5
	U+JDDZDuFNbE+o8jIz739+NnOQtiG86MnF+hh3j52u+V
X-Google-Smtp-Source: ACHHUZ5TQtLm4w1zomBPWtg5livCUfW9qUaChpqX9gLrI2hJFuJlMY9gzdUTDpahjvsiOe3VT7Ak1ylon2zyCj67E9c=
X-Received: by 2002:ac2:4c08:0:b0:4ee:8ff3:c981 with SMTP id
 t8-20020ac24c08000000b004ee8ff3c981mr7204019lfq.10.1684185167622; Mon, 15 May
 2023 14:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230510003751.84732-1-bryanhundven@gmail.com> <CA+5PVA6kfsYYf5NNGnHqpdbP_T7m7TYL-QYZvdi-+qM7EAB6DQ@mail.gmail.com>
In-Reply-To: <CA+5PVA6kfsYYf5NNGnHqpdbP_T7m7TYL-QYZvdi-+qM7EAB6DQ@mail.gmail.com>
From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 15 May 2023 14:12:36 -0700
Message-ID: <CAJ+oik2LLZmjv4dDcEnd4fDq7wa0MzE4s-jrYy_RKYOy4fpC3A@mail.gmail.com>
Subject: Re: [PATCH] Clean up check_whence.py style
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000a6f7df05fbc1eabc"

--000000000000a6f7df05fbc1eabc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 11:33=E2=80=AFAM Josh Boyer <jwboyer@kernel.org> wr=
ote:

> On Tue, May 9, 2023 at 8:38=E2=80=AFPM Bryan Hundven <bryanhundven@gmail.=
com>
> wrote:
> >
> > Use flake8, pylint, and black to clean up python code style for
> > check_whence.py and potentially any future python scripts.
> >
> > Signed-off-by: Bryan Hundven <bryanhundven@gmail.com>
>
> Ironically, this patch actually causes check_whence.py to fail after
> it is applied.
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: .flake8 not listed in WHENCE
> E: .pylintrc not listed in WHENCE
> [jwboyer@vader linux-firmware]$
>
> Can you fix this up?
>

I missed that, I updated the change, but it didn't respond to this thread,
sorry about that.

-Bryan


>
> josh
>
> > ---
> >  .flake8         |   2 +
> >  .pylintrc       | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  check_whence.py |  84 ++++---
> >  3 files changed, 689 insertions(+), 27 deletions(-)
> >  create mode 100644 .flake8
> >  create mode 100644 .pylintrc
> >
> > diff --git a/.flake8 b/.flake8
> > new file mode 100644
> > index 0000000..7da1f96
> > --- /dev/null
> > +++ b/.flake8
> > @@ -0,0 +1,2 @@
> > +[flake8]
> > +max-line-length =3D 100
> > diff --git a/.pylintrc b/.pylintrc
> > new file mode 100644
> > index 0000000..202ec02
> > --- /dev/null
> > +++ b/.pylintrc
> > @@ -0,0 +1,630 @@
> > +[MAIN]
> > +
> > +# Analyse import fallback blocks. This can be used to support both
> Python 2 and
> > +# 3 compatible code, which means that the block might have code that
> exists
> > +# only in one or another interpreter, leading to false positives when
> analysed.
> > +analyse-fallback-blocks=3Dno
> > +
> > +# Clear in-memory caches upon conclusion of linting. Useful if running
> pylint
> > +# in a server-like mode.
> > +clear-cache-post-run=3Dno
> > +
> > +# Load and enable all available extensions. Use --list-extensions to
> see a list
> > +# all available extensions.
> > +#enable-all-extensions=3D
> > +
> > +# In error mode, messages with a category besides ERROR or FATAL are
> > +# suppressed, and no reports are done by default. Error mode is
> compatible with
> > +# disabling specific errors.
> > +#errors-only=3D
> > +
> > +# Always return a 0 (non-error) status code, even if lint errors are
> found.
> > +# This is primarily useful in continuous integration scripts.
> > +#exit-zero=3D
> > +
> > +# A comma-separated list of package or module names from where C
> extensions may
> > +# be loaded. Extensions are loading into the active Python interpreter
> and may
> > +# run arbitrary code.
> > +extension-pkg-allow-list=3D
> > +
> > +# A comma-separated list of package or module names from where C
> extensions may
> > +# be loaded. Extensions are loading into the active Python interpreter
> and may
> > +# run arbitrary code. (This is an alternative name to
> extension-pkg-allow-list
> > +# for backward compatibility.)
> > +extension-pkg-whitelist=3D
> > +
> > +# Return non-zero exit code if any of these messages/categories are
> detected,
> > +# even if score is above --fail-under value. Syntax same as enable.
> Messages
> > +# specified are enabled, while categories only check already-enabled
> messages.
> > +fail-on=3D
> > +
> > +# Specify a score threshold under which the program will exit with
> error.
> > +fail-under=3D10
> > +
> > +# Interpret the stdin as a python script, whose filename needs to be
> passed as
> > +# the module_or_package argument.
> > +#from-stdin=3D
> > +
> > +# Files or directories to be skipped. They should be base names, not
> paths.
> > +ignore=3DCVS
> > +
> > +# Add files or directories matching the regular expressions patterns t=
o
> the
> > +# ignore-list. The regex matches against paths and can be in Posix or
> Windows
> > +# format. Because '\\' represents the directory delimiter on Windows
> systems,
> > +# it can't be used as an escape character.
> > +ignore-paths=3D
> > +
> > +# Files or directories matching the regular expression patterns are
> skipped.
> > +# The regex matches against base names, not paths. The default value
> ignores
> > +# Emacs file locks
> > +ignore-patterns=3D^\.#
> > +
> > +# List of module names for which member attributes should not be check=
ed
> > +# (useful for modules/projects where namespaces are manipulated during
> runtime
> > +# and thus existing member attributes cannot be deduced by static
> analysis). It
> > +# supports qualified module names, as well as Unix pattern matching.
> > +ignored-modules=3D
> > +
> > +# Python code to execute, usually for sys.path manipulation such as
> > +# pygtk.require().
> > +#init-hook=3D
> > +
> > +# Use multiple processes to speed up Pylint. Specifying 0 will
> auto-detect the
> > +# number of processors available to use, and will cap the count on
> Windows to
> > +# avoid hangs.
> > +jobs=3D1
> > +
> > +# Control the amount of potential inferred values when inferring a
> single
> > +# object. This can help the performance when dealing with large
> functions or
> > +# complex, nested conditions.
> > +limit-inference-results=3D100
> > +
> > +# List of plugins (as comma separated values of python module names) t=
o
> load,
> > +# usually to register additional checkers.
> > +load-plugins=3D
> > +
> > +# Pickle collected data for later comparisons.
> > +persistent=3Dyes
> > +
> > +# Minimum Python version to use for version dependent checks. Will
> default to
> > +# the version used to run pylint.
> > +py-version=3D3.11
> > +
> > +# Discover python modules and packages in the file system subtree.
> > +recursive=3Dno
> > +
> > +# Add paths to the list of the source roots. Supports globbing
> patterns. The
> > +# source root is an absolute path or a path relative to the current
> working
> > +# directory used to determine a package namespace for modules located
> under the
> > +# source root.
> > +source-roots=3D
> > +
> > +# When enabled, pylint would attempt to guess common misconfiguration
> and emit
> > +# user-friendly hints instead of false-positive error messages.
> > +suggestion-mode=3Dyes
> > +
> > +# Allow loading of arbitrary C extensions. Extensions are imported int=
o
> the
> > +# active Python interpreter and may run arbitrary code.
> > +unsafe-load-any-extension=3Dno
> > +
> > +# In verbose mode, extra non-checker-related info will be displayed.
> > +#verbose=3D
> > +
> > +
> > +[BASIC]
> > +
> > +# Naming style matching correct argument names.
> > +argument-naming-style=3Dsnake_case
> > +
> > +# Regular expression matching correct argument names. Overrides
> argument-
> > +# naming-style. If left empty, argument names will be checked with the
> set
> > +# naming style.
> > +#argument-rgx=3D
> > +
> > +# Naming style matching correct attribute names.
> > +attr-naming-style=3Dsnake_case
> > +
> > +# Regular expression matching correct attribute names. Overrides
> attr-naming-
> > +# style. If left empty, attribute names will be checked with the set
> naming
> > +# style.
> > +#attr-rgx=3D
> > +
> > +# Bad variable names which should always be refused, separated by a
> comma.
> > +bad-names=3Dfoo,
> > +          bar,
> > +          baz,
> > +          toto,
> > +          tutu,
> > +          tata
> > +
> > +# Bad variable names regexes, separated by a comma. If names match any
> regex,
> > +# they will always be refused
> > +bad-names-rgxs=3D
> > +
> > +# Naming style matching correct class attribute names.
> > +class-attribute-naming-style=3Dany
> > +
> > +# Regular expression matching correct class attribute names. Overrides
> class-
> > +# attribute-naming-style. If left empty, class attribute names will be
> checked
> > +# with the set naming style.
> > +#class-attribute-rgx=3D
> > +
> > +# Naming style matching correct class constant names.
> > +class-const-naming-style=3DUPPER_CASE
> > +
> > +# Regular expression matching correct class constant names. Overrides
> class-
> > +# const-naming-style. If left empty, class constant names will be
> checked with
> > +# the set naming style.
> > +#class-const-rgx=3D
> > +
> > +# Naming style matching correct class names.
> > +class-naming-style=3DPascalCase
> > +
> > +# Regular expression matching correct class names. Overrides
> class-naming-
> > +# style. If left empty, class names will be checked with the set namin=
g
> style.
> > +#class-rgx=3D
> > +
> > +# Naming style matching correct constant names.
> > +const-naming-style=3DUPPER_CASE
> > +
> > +# Regular expression matching correct constant names. Overrides
> const-naming-
> > +# style. If left empty, constant names will be checked with the set
> naming
> > +# style.
> > +#const-rgx=3D
> > +
> > +# Minimum line length for functions/classes that require docstrings,
> shorter
> > +# ones are exempt.
> > +docstring-min-length=3D-1
> > +
> > +# Naming style matching correct function names.
> > +function-naming-style=3Dsnake_case
> > +
> > +# Regular expression matching correct function names. Overrides
> function-
> > +# naming-style. If left empty, function names will be checked with the
> set
> > +# naming style.
> > +#function-rgx=3D
> > +
> > +# Good variable names which should always be accepted, separated by a
> comma.
> > +good-names=3Di,
> > +           j,
> > +           k,
> > +           ex,
> > +           Run,
> > +           _
> > +
> > +# Good variable names regexes, separated by a comma. If names match an=
y
> regex,
> > +# they will always be accepted
> > +good-names-rgxs=3D
> > +
> > +# Include a hint for the correct naming format with invalid-name.
> > +include-naming-hint=3Dno
> > +
> > +# Naming style matching correct inline iteration names.
> > +inlinevar-naming-style=3Dany
> > +
> > +# Regular expression matching correct inline iteration names. Override=
s
> > +# inlinevar-naming-style. If left empty, inline iteration names will b=
e
> checked
> > +# with the set naming style.
> > +#inlinevar-rgx=3D
> > +
> > +# Naming style matching correct method names.
> > +method-naming-style=3Dsnake_case
> > +
> > +# Regular expression matching correct method names. Overrides
> method-naming-
> > +# style. If left empty, method names will be checked with the set
> naming style.
> > +#method-rgx=3D
> > +
> > +# Naming style matching correct module names.
> > +module-naming-style=3Dsnake_case
> > +
> > +# Regular expression matching correct module names. Overrides
> module-naming-
> > +# style. If left empty, module names will be checked with the set
> naming style.
> > +#module-rgx=3D
> > +
> > +# Colon-delimited sets of names that determine each other's naming
> style when
> > +# the name regexes allow several styles.
> > +name-group=3D
> > +
> > +# Regular expression which should only match function or class names
> that do
> > +# not require a docstring.
> > +no-docstring-rgx=3D^_
> > +
> > +# List of decorators that produce properties, such as
> abc.abstractproperty. Add
> > +# to this list to register other decorators that produce valid
> properties.
> > +# These decorators are taken in consideration only for invalid-name.
> > +property-classes=3Dabc.abstractproperty
> > +
> > +# Regular expression matching correct type alias names. If left empty,
> type
> > +# alias names will be checked with the set naming style.
> > +#typealias-rgx=3D
> > +
> > +# Regular expression matching correct type variable names. If left
> empty, type
> > +# variable names will be checked with the set naming style.
> > +#typevar-rgx=3D
> > +
> > +# Naming style matching correct variable names.
> > +variable-naming-style=3Dsnake_case
> > +
> > +# Regular expression matching correct variable names. Overrides
> variable-
> > +# naming-style. If left empty, variable names will be checked with the
> set
> > +# naming style.
> > +#variable-rgx=3D
> > +
> > +
> > +[CLASSES]
> > +
> > +# Warn about protected attribute access inside special methods
> > +check-protected-access-in-special-methods=3Dno
> > +
> > +# List of method names used to declare (i.e. assign) instance
> attributes.
> > +defining-attr-methods=3D__init__,
> > +                      __new__,
> > +                      setUp,
> > +                      __post_init__
> > +
> > +# List of member names, which should be excluded from the protected
> access
> > +# warning.
> > +exclude-protected=3D_asdict,_fields,_replace,_source,_make,os._exit
> > +
> > +# List of valid names for the first argument in a class method.
> > +valid-classmethod-first-arg=3Dcls
> > +
> > +# List of valid names for the first argument in a metaclass class
> method.
> > +valid-metaclass-classmethod-first-arg=3Dmcs
> > +
> > +
> > +[DESIGN]
> > +
> > +# List of regular expressions of class ancestor names to ignore when
> counting
> > +# public methods (see R0903)
> > +exclude-too-few-public-methods=3D
> > +
> > +# List of qualified class names to ignore when counting class parents
> (see
> > +# R0901)
> > +ignored-parents=3D
> > +
> > +# Maximum number of arguments for function / method.
> > +max-args=3D5
> > +
> > +# Maximum number of attributes for a class (see R0902).
> > +max-attributes=3D7
> > +
> > +# Maximum number of boolean expressions in an if statement (see R0916)=
.
> > +max-bool-expr=3D5
> > +
> > +# Maximum number of branch for function / method body.
> > +max-branches=3D12
> > +
> > +# Maximum number of locals for function / method body.
> > +max-locals=3D15
> > +
> > +# Maximum number of parents for a class (see R0901).
> > +max-parents=3D7
> > +
> > +# Maximum number of public methods for a class (see R0904).
> > +max-public-methods=3D20
> > +
> > +# Maximum number of return / yield for function / method body.
> > +max-returns=3D6
> > +
> > +# Maximum number of statements in function / method body.
> > +max-statements=3D50
> > +
> > +# Minimum number of public methods for a class (see R0903).
> > +min-public-methods=3D2
> > +
> > +
> > +[EXCEPTIONS]
> > +
> > +# Exceptions that will emit a warning when caught.
> > +overgeneral-exceptions=3Dbuiltins.BaseException,builtins.Exception
> > +
> > +
> > +[FORMAT]
> > +
> > +# Expected format of line ending, e.g. empty (any line ending), LF or
> CRLF.
> > +expected-line-ending-format=3D
> > +
> > +# Regexp for a line that is allowed to be longer than the limit.
> > +ignore-long-lines=3D^\s*(# )?<?https?://\S+>?$
> > +
> > +# Number of spaces of indent required inside a hanging or continued
> line.
> > +indent-after-paren=3D4
> > +
> > +# String used as indentation unit. This is usually "    " (4 spaces) o=
r
> "\t" (1
> > +# tab).
> > +indent-string=3D'    '
> > +
> > +# Maximum number of characters on a single line.
> > +max-line-length=3D100
> > +
> > +# Maximum number of lines in a module.
> > +max-module-lines=3D1000
> > +
> > +# Allow the body of a class to be on the same line as the declaration
> if body
> > +# contains single statement.
> > +single-line-class-stmt=3Dno
> > +
> > +# Allow the body of an if to be on the same line as the test if there
> is no
> > +# else.
> > +single-line-if-stmt=3Dno
> > +
> > +
> > +[IMPORTS]
> > +
> > +# List of modules that can be imported at any level, not just the top
> level
> > +# one.
> > +allow-any-import-level=3D
> > +
> > +# Allow explicit reexports by alias from a package __init__.
> > +allow-reexport-from-package=3Dno
> > +
> > +# Allow wildcard imports from modules that define __all__.
> > +allow-wildcard-with-all=3Dno
> > +
> > +# Deprecated modules which should not be used, separated by a comma.
> > +deprecated-modules=3D
> > +
> > +# Output a graph (.gv or any supported image format) of external
> dependencies
> > +# to the given file (report RP0402 must not be disabled).
> > +ext-import-graph=3D
> > +
> > +# Output a graph (.gv or any supported image format) of all (i.e.
> internal and
> > +# external) dependencies to the given file (report RP0402 must not be
> > +# disabled).
> > +import-graph=3D
> > +
> > +# Output a graph (.gv or any supported image format) of internal
> dependencies
> > +# to the given file (report RP0402 must not be disabled).
> > +int-import-graph=3D
> > +
> > +# Force import order to recognize a module as part of the standard
> > +# compatibility libraries.
> > +known-standard-library=3D
> > +
> > +# Force import order to recognize a module as part of a third party
> library.
> > +known-third-party=3Denchant
> > +
> > +# Couples of modules and preferred modules, separated by a comma.
> > +preferred-modules=3D
> > +
> > +
> > +[LOGGING]
> > +
> > +# The type of string formatting that logging methods do. `old` means
> using %
> > +# formatting, `new` is for `{}` formatting.
> > +logging-format-style=3Dold
> > +
> > +# Logging modules to check that the string format arguments are in
> logging
> > +# function parameter format.
> > +logging-modules=3Dlogging
> > +
> > +
> > +[MESSAGES CONTROL]
> > +
> > +# Only show warnings with the listed confidence levels. Leave empty to
> show
> > +# all. Valid levels: HIGH, CONTROL_FLOW, INFERENCE, INFERENCE_FAILURE,
> > +# UNDEFINED.
> > +confidence=3DHIGH,
> > +           CONTROL_FLOW,
> > +           INFERENCE,
> > +           INFERENCE_FAILURE,
> > +           UNDEFINED
> > +
> > +# Disable the message, report, category or checker with the given
> id(s). You
> > +# can either give multiple identifiers separated by comma (,) or put
> this
> > +# option multiple times (only on the command line, not in the
> configuration
> > +# file where it should appear only once). You can also use
> "--disable=3Dall" to
> > +# disable everything first and then re-enable specific checks. For
> example, if
> > +# you want to run only the similarities checker, you can use
> "--disable=3Dall
> > +# --enable=3Dsimilarities". If you want to run only the classes checke=
r,
> but have
> > +# no Warning level messages displayed, use "--disable=3Dall
> --enable=3Dclasses
> > +# --disable=3DW".
> > +disable=3Draw-checker-failed,
> > +        bad-inline-option,
> > +        locally-disabled,
> > +        file-ignored,
> > +        suppressed-message,
> > +        useless-suppression,
> > +        deprecated-pragma,
> > +        use-symbolic-message-instead
> > +
> > +# Enable the message, report, category or checker with the given id(s)=
.
> You can
> > +# either give multiple identifier separated by comma (,) or put this
> option
> > +# multiple time (only on the command line, not in the configuration
> file where
> > +# it should appear only once). See also the "--disable" option for
> examples.
> > +enable=3Dc-extension-no-member
> > +
> > +
> > +[METHOD_ARGS]
> > +
> > +# List of qualified names (i.e., library.method) which require a timeo=
ut
> > +# parameter e.g. 'requests.api.get,requests.api.post'
> >
> +timeout-methods=3Drequests.api.delete,requests.api.get,requests.api.head=
,requests.api.options,requests.api.patch,
> requests.api.post,requests.api.put,requests.api.request
> > +
> > +
> > +[MISCELLANEOUS]
> > +
> > +# List of note tags to take in consideration, separated by a comma.
> > +notes=3DFIXME,
> > +      XXX,
> > +      TODO
> > +
> > +# Regular expression of note tags to take in consideration.
> > +notes-rgx=3D
> > +
> > +
> > +[REFACTORING]
> > +
> > +# Maximum number of nested blocks for function / method body
> > +max-nested-blocks=3D5
> > +
> > +# Complete name of functions that never returns. When checking for
> > +# inconsistent-return-statements if a never returning function is
> called then
> > +# it will be considered as an explicit return statement and no message
> will be
> > +# printed.
> > +never-returning-functions=3Dsys.exit,argparse.parse_error
> > +
> > +
> > +[REPORTS]
> > +
> > +# Python expression which should return a score less than or equal to
> 10. You
> > +# have access to the variables 'fatal', 'error', 'warning', 'refactor'=
,
> > +# 'convention', and 'info' which contain the number of messages in eac=
h
> > +# category, as well as 'statement' which is the total number of
> statements
> > +# analyzed. This score is used by the global evaluation report (RP0004=
).
> > +evaluation=3Dmax(0, 0 if fatal else 10.0 - ((float(5 * error + warning=
 +
> refactor + convention) / statement) * 10))
> > +
> > +# Template used to display messages. This is a python new-style format
> string
> > +# used to format the message information. See doc for all details.
> > +msg-template=3D
> > +
> > +# Set the output format. Available formats are text, parseable,
> colorized, json
> > +# and msvs (visual studio). You can also give a reporter class, e.g.
> > +# mypackage.mymodule.MyReporterClass.
> > +#output-format=3D
> > +
> > +# Tells whether to display a full report or only the messages.
> > +reports=3Dno
> > +
> > +# Activate the evaluation score.
> > +score=3Dyes
> > +
> > +
> > +[SIMILARITIES]
> > +
> > +# Comments are removed from the similarity computation
> > +ignore-comments=3Dyes
> > +
> > +# Docstrings are removed from the similarity computation
> > +ignore-docstrings=3Dyes
> > +
> > +# Imports are removed from the similarity computation
> > +ignore-imports=3Dyes
> > +
> > +# Signatures are removed from the similarity computation
> > +ignore-signatures=3Dyes
> > +
> > +# Minimum lines number of a similarity.
> > +min-similarity-lines=3D4
> > +
> > +
> > +[SPELLING]
> > +
> > +# Limits count of emitted suggestions for spelling mistakes.
> > +max-spelling-suggestions=3D4
> > +
> > +# Spelling dictionary name. No available dictionaries : You need to
> install
> > +# both the python package and the system dependency for enchant to
> work..
> > +spelling-dict=3D
> > +
> > +# List of comma separated words that should be considered directives i=
f
> they
> > +# appear at the beginning of a comment and should not be checked.
> > +spelling-ignore-comment-directives=3Dfmt: on,fmt:
> off,noqa:,noqa,nosec,isort:skip,mypy:
> > +
> > +# List of comma separated words that should not be checked.
> > +spelling-ignore-words=3D
> > +
> > +# A path to a file that contains the private dictionary; one word per
> line.
> > +spelling-private-dict-file=3D
> > +
> > +# Tells whether to store unknown words to the private dictionary (see
> the
> > +# --spelling-private-dict-file option) instead of raising a message.
> > +spelling-store-unknown-words=3Dno
> > +
> > +
> > +[STRING]
> > +
> > +# This flag controls whether inconsistent-quotes generates a warning
> when the
> > +# character used as a quote delimiter is used inconsistently within a
> module.
> > +check-quote-consistency=3Dno
> > +
> > +# This flag controls whether the implicit-str-concat should generate a
> warning
> > +# on implicit string concatenation in sequences defined over several
> lines.
> > +check-str-concat-over-line-jumps=3Dno
> > +
> > +
> > +[TYPECHECK]
> > +
> > +# List of decorators that produce context managers, such as
> > +# contextlib.contextmanager. Add to this list to register other
> decorators that
> > +# produce valid context managers.
> > +contextmanager-decorators=3Dcontextlib.contextmanager
> > +
> > +# List of members which are set dynamically and missed by pylint
> inference
> > +# system, and so shouldn't trigger E1101 when accessed. Python regular
> > +# expressions are accepted.
> > +generated-members=3D
> > +
> > +# Tells whether to warn about missing members when the owner of the
> attribute
> > +# is inferred to be None.
> > +ignore-none=3Dyes
> > +
> > +# This flag controls whether pylint should warn about no-member and
> similar
> > +# checks whenever an opaque object is returned when inferring. The
> inference
> > +# can return multiple potential results while evaluating a Python
> object, but
> > +# some branches might not be evaluated, which results in partial
> inference. In
> > +# that case, it might be useful to still emit no-member and other
> checks for
> > +# the rest of the inferred objects.
> > +ignore-on-opaque-inference=3Dyes
> > +
> > +# List of symbolic message names to ignore for Mixin members.
> > +ignored-checks-for-mixins=3Dno-member,
> > +                          not-async-context-manager,
> > +                          not-context-manager,
> > +                          attribute-defined-outside-init
> > +
> > +# List of class names for which member attributes should not be checke=
d
> (useful
> > +# for classes with dynamically set attributes). This supports the use =
of
> > +# qualified names.
> >
> +ignored-classes=3Doptparse.Values,thread._local,_thread._local,argparse.=
Namespace
> > +
> > +# Show a hint with possible names when a member name was not found. Th=
e
> aspect
> > +# of finding the hint is based on edit distance.
> > +missing-member-hint=3Dyes
> > +
> > +# The minimum edit distance a name should have in order to be
> considered a
> > +# similar match for a missing member name.
> > +missing-member-hint-distance=3D1
> > +
> > +# The total number of similar names that should be taken in
> consideration when
> > +# showing a hint for a missing member.
> > +missing-member-max-choices=3D1
> > +
> > +# Regex pattern to define which classes are considered mixins.
> > +mixin-class-rgx=3D.*[Mm]ixin
> > +
> > +# List of decorators that change the signature of a decorated function=
.
> > +signature-mutators=3D
> > +
> > +
> > +[VARIABLES]
> > +
> > +# List of additional names supposed to be defined in builtins. Remembe=
r
> that
> > +# you should avoid defining new builtins when possible.
> > +additional-builtins=3D
> > +
> > +# Tells whether unused global variables should be treated as a
> violation.
> > +allow-global-unused-variables=3Dyes
> > +
> > +# List of names allowed to shadow builtins
> > +allowed-redefined-builtins=3D
> > +
> > +# List of strings which can identify a callback function by name. A
> callback
> > +# name must start or end with one of those strings.
> > +callbacks=3Dcb_,
> > +          _cb
> > +
> > +# A regular expression matching the name of dummy variables (i.e.
> expected to
> > +# not be used).
> >
> +dummy-variables-rgx=3D_+$|(_[a-zA-Z0-9_]*[a-zA-Z0-9]+?$)|dummy|^ignored_=
|^unused_
> > +
> > +# Argument names that match this expression will be ignored.
> > +ignored-argument-names=3D_.*|^ignored_|^unused_
> > +
> > +# Tells whether we should check for unused import in __init__ files.
> > +init-import=3Dno
> > +
> > +# List of qualified module names which can have objects that can
> redefine
> > +# builtins.
> >
> +redefining-builtins-modules=3Dsix.moves,past.builtins,future.builtins,bu=
iltins,io
> > diff --git a/check_whence.py b/check_whence.py
> > index 711be36..4dfda90 100755
> > --- a/check_whence.py
> > +++ b/check_whence.py
> > @@ -1,73 +1,102 @@
> > -#!/usr/bin/python3
> > +#!/usr/bin/env python3
> > +""" check_whence """
> >
> > -import os, re, sys
> > +import os
> > +import re
> > +import sys
> >  from io import open
> >
> > +
> >  def list_whence():
> > -    with open('WHENCE', encoding=3D'utf-8') as whence:
> > +    """
> > +    list_whence
> > +    """
> > +    with open("WHENCE", encoding=3D"utf-8") as whence:
> >          for line in whence:
> >              match =3D re.match(r'(?:File|Source):\s*"(.*)"', line)
> >              if match:
> >                  yield match.group(1)
> >                  continue
> > -            match =3D re.match(r'(?:File|Source):\s*(\S*)', line)
> > +            match =3D re.match(r"(?:File|Source):\s*(\S*)", line)
> >              if match:
> >                  yield match.group(1)
> >                  continue
> > -            match =3D re.match(r'Licen[cs]e: (?:.*\bSee (.*) for
> details\.?|(\S*))\n',
> > -                             line)
> > +            match =3D re.match(
> > +                r"Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n"=
,
> line
> > +            )
> >              if match:
> >                  if match.group(1):
> > -                    for name in re.split(r', | and ', match.group(1)):
> > +                    for name in re.split(r", | and ", match.group(1)):
> >                          yield name
> >                      continue
> >                  if match.group(2):
> >                      # Just one word - may or may not be a filename
> > -                    if not re.search(r'unknown|distributable',
> match.group(2),
> > -                                     re.IGNORECASE):
> > +                    if not re.search(
> > +                        r"unknown|distributable", match.group(2),
> re.IGNORECASE
> > +                    ):
> >                          yield match.group(2)
> >                          continue
> >
> > +
> >  def list_whence_files():
> > -    with open('WHENCE', encoding=3D'utf-8') as whence:
> > +    """
> > +    list_whence_files
> > +    """
> > +    with open("WHENCE", encoding=3D"utf-8") as whence:
> >          for line in whence:
> > -            match =3D re.match(r'File:\s*(.*)', line)
> > +            match =3D re.match(r"File:\s*(.*)", line)
> >              if match:
> > -                yield match.group(1).replace("\ ", " ")
> > +                yield match.group(1).replace(r"\ ", " ")
> >                  continue
> >
> > +
> >  def list_git():
> > -    with os.popen('git ls-files') as git_files:
> > +    """
> > +    list_git
> > +    """
> > +    with os.popen("git ls-files") as git_files:
> >          for line in git_files:
> > -            yield line.rstrip('\n')
> > +            yield line.rstrip("\n")
> > +
> >
> >  def main():
> > +    """
> > +    main
> > +    """
> >      ret =3D 0
> >      whence_list =3D list(list_whence())
> >      whence_files =3D list(list_whence_files())
> > -    known_files =3D set(name for name in whence_list if not
> name.endswith('/')) | \
> > -                  set(['check_whence.py', 'configure', 'Makefile',
> > -                       'README', 'copy-firmware.sh', 'WHENCE'])
> > -    known_prefixes =3D set(name for name in whence_list if
> name.endswith('/'))
> > +    # pylint: disable-next=3Dline-too-long
> > +    known_files =3D set(name for name in whence_list if not
> name.endswith("/")) | set(
> > +        [
> > +            "check_whence.py",
> > +            "configure",
> > +            "Makefile",
> > +            "README",
> > +            "copy-firmware.sh",
> > +            "WHENCE",
> > +        ]
> > +    )
> > +    known_prefixes =3D set(name for name in whence_list if
> name.endswith("/"))
> >      git_files =3D set(list_git())
> >
> > -    for name in set(name for name in whence_files if
> name.endswith('/')):
> > -        sys.stderr.write('E: %s listed in WHENCE as File, but is
> directory\n' %
> > -                         name)
> > +    for name in set(name for name in whence_files if
> name.endswith("/")):
> > +        sys.stderr.write(f"E: {name} listed in WHENCE as File, but is
> directory\n")
> >          ret =3D 1
> >
> >      for name in set(fw for fw in whence_files if whence_files.count(fw=
)
> > 1):
> > -        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
> > +        sys.stderr.write(f"E: {name} listed in WHENCE twice\n")
> >          ret =3D 1
> >
> >      for name in sorted(list(known_files - git_files)):
> > -        sys.stderr.write('E: %s listed in WHENCE does not exist\n' %
> name)
> > +        sys.stderr.write(f"E: {name} listed in WHENCE does not exist\n=
"
> % name)
> >          ret =3D 1
> >
> >      for name in sorted(list(git_files - known_files)):
> >          # Ignore subdirectory changelogs and GPG detached signatures
> > -        if (name.endswith('/ChangeLog') or
> > -            (name.endswith('.asc') and name[:-4] in known_files)):
> > +        if name.endswith("/ChangeLog") or (
> > +            name.endswith(".asc") and name[:-4] in known_files
> > +        ):
> >              continue
> >
> >          # Ignore unknown files in known directories
> > @@ -75,9 +104,10 @@ def main():
> >              if name.startswith(prefix):
> >                  break
> >          else:
> > -            sys.stderr.write('E: %s not listed in WHENCE\n' % name)
> > +            sys.stderr.write(f"E: {name} not listed in WHENCE\n")
> >              ret =3D 1
> >      return ret
> >
> > -if __name__ =3D=3D '__main__':
> > +
> > +if __name__ =3D=3D "__main__":
> >      sys.exit(main())
> > --
> > 2.40.1
> >
>

--000000000000a6f7df05fbc1eabc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, May 15, 2023 at 11:33=E2=80=AFAM =
Josh Boyer &lt;<a href=3D"mailto:jwboyer@kernel.org">jwboyer@kernel.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, May 9, 2023 at 8:38=E2=80=AFPM Bryan Hundven &lt;<a href=3D"mailto:brya=
nhundven@gmail.com" target=3D"_blank">bryanhundven@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Use flake8, pylint, and black to clean up python code style for<br>
&gt; check_whence.py and potentially any future python scripts.<br>
&gt;<br>
&gt; Signed-off-by: Bryan Hundven &lt;<a href=3D"mailto:bryanhundven@gmail.=
com" target=3D"_blank">bryanhundven@gmail.com</a>&gt;<br>
<br>
Ironically, this patch actually causes check_whence.py to fail after<br>
it is applied.<br>
<br>
[jwboyer@vader linux-firmware]$ ./check_whence.py<br>
E: .flake8 not listed in WHENCE<br>
E: .pylintrc not listed in WHENCE<br>
[jwboyer@vader linux-firmware]$<br>
<br>
Can you fix this up?<br></blockquote><div><br></div><div>I missed that, I u=
pdated the change, but it didn&#39;t respond to this thread, sorry about th=
at.</div><div><br></div><div>-Bryan</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
josh<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .flake8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .pylintrc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 630 ++++++++++++++++++++++=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 check_whence.py |=C2=A0 84 ++++---<br>
&gt;=C2=A0 3 files changed, 689 insertions(+), 27 deletions(-)<br>
&gt;=C2=A0 create mode 100644 .flake8<br>
&gt;=C2=A0 create mode 100644 .pylintrc<br>
&gt;<br>
&gt; diff --git a/.flake8 b/.flake8<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7da1f96<br>
&gt; --- /dev/null<br>
&gt; +++ b/.flake8<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +[flake8]<br>
&gt; +max-line-length =3D 100<br>
&gt; diff --git a/.pylintrc b/.pylintrc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..202ec02<br>
&gt; --- /dev/null<br>
&gt; +++ b/.pylintrc<br>
&gt; @@ -0,0 +1,630 @@<br>
&gt; +[MAIN]<br>
&gt; +<br>
&gt; +# Analyse import fallback blocks. This can be used to support both Py=
thon 2 and<br>
&gt; +# 3 compatible code, which means that the block might have code that =
exists<br>
&gt; +# only in one or another interpreter, leading to false positives when=
 analysed.<br>
&gt; +analyse-fallback-blocks=3Dno<br>
&gt; +<br>
&gt; +# Clear in-memory caches upon conclusion of linting. Useful if runnin=
g pylint<br>
&gt; +# in a server-like mode.<br>
&gt; +clear-cache-post-run=3Dno<br>
&gt; +<br>
&gt; +# Load and enable all available extensions. Use --list-extensions to =
see a list<br>
&gt; +# all available extensions.<br>
&gt; +#enable-all-extensions=3D<br>
&gt; +<br>
&gt; +# In error mode, messages with a category besides ERROR or FATAL are<=
br>
&gt; +# suppressed, and no reports are done by default. Error mode is compa=
tible with<br>
&gt; +# disabling specific errors.<br>
&gt; +#errors-only=3D<br>
&gt; +<br>
&gt; +# Always return a 0 (non-error) status code, even if lint errors are =
found.<br>
&gt; +# This is primarily useful in continuous integration scripts.<br>
&gt; +#exit-zero=3D<br>
&gt; +<br>
&gt; +# A comma-separated list of package or module names from where C exte=
nsions may<br>
&gt; +# be loaded. Extensions are loading into the active Python interprete=
r and may<br>
&gt; +# run arbitrary code.<br>
&gt; +extension-pkg-allow-list=3D<br>
&gt; +<br>
&gt; +# A comma-separated list of package or module names from where C exte=
nsions may<br>
&gt; +# be loaded. Extensions are loading into the active Python interprete=
r and may<br>
&gt; +# run arbitrary code. (This is an alternative name to extension-pkg-a=
llow-list<br>
&gt; +# for backward compatibility.)<br>
&gt; +extension-pkg-whitelist=3D<br>
&gt; +<br>
&gt; +# Return non-zero exit code if any of these messages/categories are d=
etected,<br>
&gt; +# even if score is above --fail-under value. Syntax same as enable. M=
essages<br>
&gt; +# specified are enabled, while categories only check already-enabled =
messages.<br>
&gt; +fail-on=3D<br>
&gt; +<br>
&gt; +# Specify a score threshold under which the program will exit with er=
ror.<br>
&gt; +fail-under=3D10<br>
&gt; +<br>
&gt; +# Interpret the stdin as a python script, whose filename needs to be =
passed as<br>
&gt; +# the module_or_package argument.<br>
&gt; +#from-stdin=3D<br>
&gt; +<br>
&gt; +# Files or directories to be skipped. They should be base names, not =
paths.<br>
&gt; +ignore=3DCVS<br>
&gt; +<br>
&gt; +# Add files or directories matching the regular expressions patterns =
to the<br>
&gt; +# ignore-list. The regex matches against paths and can be in Posix or=
 Windows<br>
&gt; +# format. Because &#39;\\&#39; represents the directory delimiter on =
Windows systems,<br>
&gt; +# it can&#39;t be used as an escape character.<br>
&gt; +ignore-paths=3D<br>
&gt; +<br>
&gt; +# Files or directories matching the regular expression patterns are s=
kipped.<br>
&gt; +# The regex matches against base names, not paths. The default value =
ignores<br>
&gt; +# Emacs file locks<br>
&gt; +ignore-patterns=3D^\.#<br>
&gt; +<br>
&gt; +# List of module names for which member attributes should not be chec=
ked<br>
&gt; +# (useful for modules/projects where namespaces are manipulated durin=
g runtime<br>
&gt; +# and thus existing member attributes cannot be deduced by static ana=
lysis). It<br>
&gt; +# supports qualified module names, as well as Unix pattern matching.<=
br>
&gt; +ignored-modules=3D<br>
&gt; +<br>
&gt; +# Python code to execute, usually for sys.path manipulation such as<b=
r>
&gt; +# pygtk.require().<br>
&gt; +#init-hook=3D<br>
&gt; +<br>
&gt; +# Use multiple processes to speed up Pylint. Specifying 0 will auto-d=
etect the<br>
&gt; +# number of processors available to use, and will cap the count on Wi=
ndows to<br>
&gt; +# avoid hangs.<br>
&gt; +jobs=3D1<br>
&gt; +<br>
&gt; +# Control the amount of potential inferred values when inferring a si=
ngle<br>
&gt; +# object. This can help the performance when dealing with large funct=
ions or<br>
&gt; +# complex, nested conditions.<br>
&gt; +limit-inference-results=3D100<br>
&gt; +<br>
&gt; +# List of plugins (as comma separated values of python module names) =
to load,<br>
&gt; +# usually to register additional checkers.<br>
&gt; +load-plugins=3D<br>
&gt; +<br>
&gt; +# Pickle collected data for later comparisons.<br>
&gt; +persistent=3Dyes<br>
&gt; +<br>
&gt; +# Minimum Python version to use for version dependent checks. Will de=
fault to<br>
&gt; +# the version used to run pylint.<br>
&gt; +py-version=3D3.11<br>
&gt; +<br>
&gt; +# Discover python modules and packages in the file system subtree.<br=
>
&gt; +recursive=3Dno<br>
&gt; +<br>
&gt; +# Add paths to the list of the source roots. Supports globbing patter=
ns. The<br>
&gt; +# source root is an absolute path or a path relative to the current w=
orking<br>
&gt; +# directory used to determine a package namespace for modules located=
 under the<br>
&gt; +# source root.<br>
&gt; +source-roots=3D<br>
&gt; +<br>
&gt; +# When enabled, pylint would attempt to guess common misconfiguration=
 and emit<br>
&gt; +# user-friendly hints instead of false-positive error messages.<br>
&gt; +suggestion-mode=3Dyes<br>
&gt; +<br>
&gt; +# Allow loading of arbitrary C extensions. Extensions are imported in=
to the<br>
&gt; +# active Python interpreter and may run arbitrary code.<br>
&gt; +unsafe-load-any-extension=3Dno<br>
&gt; +<br>
&gt; +# In verbose mode, extra non-checker-related info will be displayed.<=
br>
&gt; +#verbose=3D<br>
&gt; +<br>
&gt; +<br>
&gt; +[BASIC]<br>
&gt; +<br>
&gt; +# Naming style matching correct argument names.<br>
&gt; +argument-naming-style=3Dsnake_case<br>
&gt; +<br>
&gt; +# Regular expression matching correct argument names. Overrides argum=
ent-<br>
&gt; +# naming-style. If left empty, argument names will be checked with th=
e set<br>
&gt; +# naming style.<br>
&gt; +#argument-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct attribute names.<br>
&gt; +attr-naming-style=3Dsnake_case<br>
&gt; +<br>
&gt; +# Regular expression matching correct attribute names. Overrides attr=
-naming-<br>
&gt; +# style. If left empty, attribute names will be checked with the set =
naming<br>
&gt; +# style.<br>
&gt; +#attr-rgx=3D<br>
&gt; +<br>
&gt; +# Bad variable names which should always be refused, separated by a c=
omma.<br>
&gt; +bad-names=3Dfoo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bar,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 baz,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 toto,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tutu,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tata<br>
&gt; +<br>
&gt; +# Bad variable names regexes, separated by a comma. If names match an=
y regex,<br>
&gt; +# they will always be refused<br>
&gt; +bad-names-rgxs=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct class attribute names.<br>
&gt; +class-attribute-naming-style=3Dany<br>
&gt; +<br>
&gt; +# Regular expression matching correct class attribute names. Override=
s class-<br>
&gt; +# attribute-naming-style. If left empty, class attribute names will b=
e checked<br>
&gt; +# with the set naming style.<br>
&gt; +#class-attribute-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct class constant names.<br>
&gt; +class-const-naming-style=3DUPPER_CASE<br>
&gt; +<br>
&gt; +# Regular expression matching correct class constant names. Overrides=
 class-<br>
&gt; +# const-naming-style. If left empty, class constant names will be che=
cked with<br>
&gt; +# the set naming style.<br>
&gt; +#class-const-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct class names.<br>
&gt; +class-naming-style=3DPascalCase<br>
&gt; +<br>
&gt; +# Regular expression matching correct class names. Overrides class-na=
ming-<br>
&gt; +# style. If left empty, class names will be checked with the set nami=
ng style.<br>
&gt; +#class-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct constant names.<br>
&gt; +const-naming-style=3DUPPER_CASE<br>
&gt; +<br>
&gt; +# Regular expression matching correct constant names. Overrides const=
-naming-<br>
&gt; +# style. If left empty, constant names will be checked with the set n=
aming<br>
&gt; +# style.<br>
&gt; +#const-rgx=3D<br>
&gt; +<br>
&gt; +# Minimum line length for functions/classes that require docstrings, =
shorter<br>
&gt; +# ones are exempt.<br>
&gt; +docstring-min-length=3D-1<br>
&gt; +<br>
&gt; +# Naming style matching correct function names.<br>
&gt; +function-naming-style=3Dsnake_case<br>
&gt; +<br>
&gt; +# Regular expression matching correct function names. Overrides funct=
ion-<br>
&gt; +# naming-style. If left empty, function names will be checked with th=
e set<br>
&gt; +# naming style.<br>
&gt; +#function-rgx=3D<br>
&gt; +<br>
&gt; +# Good variable names which should always be accepted, separated by a=
 comma.<br>
&gt; +good-names=3Di,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ex,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_<br>
&gt; +<br>
&gt; +# Good variable names regexes, separated by a comma. If names match a=
ny regex,<br>
&gt; +# they will always be accepted<br>
&gt; +good-names-rgxs=3D<br>
&gt; +<br>
&gt; +# Include a hint for the correct naming format with invalid-name.<br>
&gt; +include-naming-hint=3Dno<br>
&gt; +<br>
&gt; +# Naming style matching correct inline iteration names.<br>
&gt; +inlinevar-naming-style=3Dany<br>
&gt; +<br>
&gt; +# Regular expression matching correct inline iteration names. Overrid=
es<br>
&gt; +# inlinevar-naming-style. If left empty, inline iteration names will =
be checked<br>
&gt; +# with the set naming style.<br>
&gt; +#inlinevar-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct method names.<br>
&gt; +method-naming-style=3Dsnake_case<br>
&gt; +<br>
&gt; +# Regular expression matching correct method names. Overrides method-=
naming-<br>
&gt; +# style. If left empty, method names will be checked with the set nam=
ing style.<br>
&gt; +#method-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct module names.<br>
&gt; +module-naming-style=3Dsnake_case<br>
&gt; +<br>
&gt; +# Regular expression matching correct module names. Overrides module-=
naming-<br>
&gt; +# style. If left empty, module names will be checked with the set nam=
ing style.<br>
&gt; +#module-rgx=3D<br>
&gt; +<br>
&gt; +# Colon-delimited sets of names that determine each other&#39;s namin=
g style when<br>
&gt; +# the name regexes allow several styles.<br>
&gt; +name-group=3D<br>
&gt; +<br>
&gt; +# Regular expression which should only match function or class names =
that do<br>
&gt; +# not require a docstring.<br>
&gt; +no-docstring-rgx=3D^_<br>
&gt; +<br>
&gt; +# List of decorators that produce properties, such as abc.abstractpro=
perty. Add<br>
&gt; +# to this list to register other decorators that produce valid proper=
ties.<br>
&gt; +# These decorators are taken in consideration only for invalid-name.<=
br>
&gt; +property-classes=3Dabc.abstractproperty<br>
&gt; +<br>
&gt; +# Regular expression matching correct type alias names. If left empty=
, type<br>
&gt; +# alias names will be checked with the set naming style.<br>
&gt; +#typealias-rgx=3D<br>
&gt; +<br>
&gt; +# Regular expression matching correct type variable names. If left em=
pty, type<br>
&gt; +# variable names will be checked with the set naming style.<br>
&gt; +#typevar-rgx=3D<br>
&gt; +<br>
&gt; +# Naming style matching correct variable names.<br>
&gt; +variable-naming-style=3Dsnake_case<br>
&gt; +<br>
&gt; +# Regular expression matching correct variable names. Overrides varia=
ble-<br>
&gt; +# naming-style. If left empty, variable names will be checked with th=
e set<br>
&gt; +# naming style.<br>
&gt; +#variable-rgx=3D<br>
&gt; +<br>
&gt; +<br>
&gt; +[CLASSES]<br>
&gt; +<br>
&gt; +# Warn about protected attribute access inside special methods<br>
&gt; +check-protected-access-in-special-methods=3Dno<br>
&gt; +<br>
&gt; +# List of method names used to declare (i.e. assign) instance attribu=
tes.<br>
&gt; +defining-attr-methods=3D__init__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __new__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 setUp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __post_init__<br>
&gt; +<br>
&gt; +# List of member names, which should be excluded from the protected a=
ccess<br>
&gt; +# warning.<br>
&gt; +exclude-protected=3D_asdict,_fields,_replace,_source,_make,os._exit<b=
r>
&gt; +<br>
&gt; +# List of valid names for the first argument in a class method.<br>
&gt; +valid-classmethod-first-arg=3Dcls<br>
&gt; +<br>
&gt; +# List of valid names for the first argument in a metaclass class met=
hod.<br>
&gt; +valid-metaclass-classmethod-first-arg=3Dmcs<br>
&gt; +<br>
&gt; +<br>
&gt; +[DESIGN]<br>
&gt; +<br>
&gt; +# List of regular expressions of class ancestor names to ignore when =
counting<br>
&gt; +# public methods (see R0903)<br>
&gt; +exclude-too-few-public-methods=3D<br>
&gt; +<br>
&gt; +# List of qualified class names to ignore when counting class parents=
 (see<br>
&gt; +# R0901)<br>
&gt; +ignored-parents=3D<br>
&gt; +<br>
&gt; +# Maximum number of arguments for function / method.<br>
&gt; +max-args=3D5<br>
&gt; +<br>
&gt; +# Maximum number of attributes for a class (see R0902).<br>
&gt; +max-attributes=3D7<br>
&gt; +<br>
&gt; +# Maximum number of boolean expressions in an if statement (see R0916=
).<br>
&gt; +max-bool-expr=3D5<br>
&gt; +<br>
&gt; +# Maximum number of branch for function / method body.<br>
&gt; +max-branches=3D12<br>
&gt; +<br>
&gt; +# Maximum number of locals for function / method body.<br>
&gt; +max-locals=3D15<br>
&gt; +<br>
&gt; +# Maximum number of parents for a class (see R0901).<br>
&gt; +max-parents=3D7<br>
&gt; +<br>
&gt; +# Maximum number of public methods for a class (see R0904).<br>
&gt; +max-public-methods=3D20<br>
&gt; +<br>
&gt; +# Maximum number of return / yield for function / method body.<br>
&gt; +max-returns=3D6<br>
&gt; +<br>
&gt; +# Maximum number of statements in function / method body.<br>
&gt; +max-statements=3D50<br>
&gt; +<br>
&gt; +# Minimum number of public methods for a class (see R0903).<br>
&gt; +min-public-methods=3D2<br>
&gt; +<br>
&gt; +<br>
&gt; +[EXCEPTIONS]<br>
&gt; +<br>
&gt; +# Exceptions that will emit a warning when caught.<br>
&gt; +overgeneral-exceptions=3Dbuiltins.BaseException,builtins.Exception<br=
>
&gt; +<br>
&gt; +<br>
&gt; +[FORMAT]<br>
&gt; +<br>
&gt; +# Expected format of line ending, e.g. empty (any line ending), LF or=
 CRLF.<br>
&gt; +expected-line-ending-format=3D<br>
&gt; +<br>
&gt; +# Regexp for a line that is allowed to be longer than the limit.<br>
&gt; +ignore-long-lines=3D^\s*(# )?&lt;?https?://\S+&gt;?$<br>
&gt; +<br>
&gt; +# Number of spaces of indent required inside a hanging or continued l=
ine.<br>
&gt; +indent-after-paren=3D4<br>
&gt; +<br>
&gt; +# String used as indentation unit. This is usually &quot;=C2=A0 =C2=
=A0 &quot; (4 spaces) or &quot;\t&quot; (1<br>
&gt; +# tab).<br>
&gt; +indent-string=3D&#39;=C2=A0 =C2=A0 &#39;<br>
&gt; +<br>
&gt; +# Maximum number of characters on a single line.<br>
&gt; +max-line-length=3D100<br>
&gt; +<br>
&gt; +# Maximum number of lines in a module.<br>
&gt; +max-module-lines=3D1000<br>
&gt; +<br>
&gt; +# Allow the body of a class to be on the same line as the declaration=
 if body<br>
&gt; +# contains single statement.<br>
&gt; +single-line-class-stmt=3Dno<br>
&gt; +<br>
&gt; +# Allow the body of an if to be on the same line as the test if there=
 is no<br>
&gt; +# else.<br>
&gt; +single-line-if-stmt=3Dno<br>
&gt; +<br>
&gt; +<br>
&gt; +[IMPORTS]<br>
&gt; +<br>
&gt; +# List of modules that can be imported at any level, not just the top=
 level<br>
&gt; +# one.<br>
&gt; +allow-any-import-level=3D<br>
&gt; +<br>
&gt; +# Allow explicit reexports by alias from a package __init__.<br>
&gt; +allow-reexport-from-package=3Dno<br>
&gt; +<br>
&gt; +# Allow wildcard imports from modules that define __all__.<br>
&gt; +allow-wildcard-with-all=3Dno<br>
&gt; +<br>
&gt; +# Deprecated modules which should not be used, separated by a comma.<=
br>
&gt; +deprecated-modules=3D<br>
&gt; +<br>
&gt; +# Output a graph (.gv or any supported image format) of external depe=
ndencies<br>
&gt; +# to the given file (report RP0402 must not be disabled).<br>
&gt; +ext-import-graph=3D<br>
&gt; +<br>
&gt; +# Output a graph (.gv or any supported image format) of all (i.e. int=
ernal and<br>
&gt; +# external) dependencies to the given file (report RP0402 must not be=
<br>
&gt; +# disabled).<br>
&gt; +import-graph=3D<br>
&gt; +<br>
&gt; +# Output a graph (.gv or any supported image format) of internal depe=
ndencies<br>
&gt; +# to the given file (report RP0402 must not be disabled).<br>
&gt; +int-import-graph=3D<br>
&gt; +<br>
&gt; +# Force import order to recognize a module as part of the standard<br=
>
&gt; +# compatibility libraries.<br>
&gt; +known-standard-library=3D<br>
&gt; +<br>
&gt; +# Force import order to recognize a module as part of a third party l=
ibrary.<br>
&gt; +known-third-party=3Denchant<br>
&gt; +<br>
&gt; +# Couples of modules and preferred modules, separated by a comma.<br>
&gt; +preferred-modules=3D<br>
&gt; +<br>
&gt; +<br>
&gt; +[LOGGING]<br>
&gt; +<br>
&gt; +# The type of string formatting that logging methods do. `old` means =
using %<br>
&gt; +# formatting, `new` is for `{}` formatting.<br>
&gt; +logging-format-style=3Dold<br>
&gt; +<br>
&gt; +# Logging modules to check that the string format arguments are in lo=
gging<br>
&gt; +# function parameter format.<br>
&gt; +logging-modules=3Dlogging<br>
&gt; +<br>
&gt; +<br>
&gt; +[MESSAGES CONTROL]<br>
&gt; +<br>
&gt; +# Only show warnings with the listed confidence levels. Leave empty t=
o show<br>
&gt; +# all. Valid levels: HIGH, CONTROL_FLOW, INFERENCE, INFERENCE_FAILURE=
,<br>
&gt; +# UNDEFINED.<br>
&gt; +confidence=3DHIGH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONTROL_FLOW,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INFERENCE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INFERENCE_FAILURE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNDEFINED<br>
&gt; +<br>
&gt; +# Disable the message, report, category or checker with the given id(=
s). You<br>
&gt; +# can either give multiple identifiers separated by comma (,) or put =
this<br>
&gt; +# option multiple times (only on the command line, not in the configu=
ration<br>
&gt; +# file where it should appear only once). You can also use &quot;--di=
sable=3Dall&quot; to<br>
&gt; +# disable everything first and then re-enable specific checks. For ex=
ample, if<br>
&gt; +# you want to run only the similarities checker, you can use &quot;--=
disable=3Dall<br>
&gt; +# --enable=3Dsimilarities&quot;. If you want to run only the classes =
checker, but have<br>
&gt; +# no Warning level messages displayed, use &quot;--disable=3Dall --en=
able=3Dclasses<br>
&gt; +# --disable=3DW&quot;.<br>
&gt; +disable=3Draw-checker-failed,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bad-inline-option,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 locally-disabled,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file-ignored,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 suppressed-message,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 useless-suppression,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deprecated-pragma,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 use-symbolic-message-instead<br>
&gt; +<br>
&gt; +# Enable the message, report, category or checker with the given id(s=
). You can<br>
&gt; +# either give multiple identifier separated by comma (,) or put this =
option<br>
&gt; +# multiple time (only on the command line, not in the configuration f=
ile where<br>
&gt; +# it should appear only once). See also the &quot;--disable&quot; opt=
ion for examples.<br>
&gt; +enable=3Dc-extension-no-member<br>
&gt; +<br>
&gt; +<br>
&gt; +[METHOD_ARGS]<br>
&gt; +<br>
&gt; +# List of qualified names (i.e., library.method) which require a time=
out<br>
&gt; +# parameter e.g. &#39;requests.api.get,<a href=3D"http://requests.api=
.post" rel=3D"noreferrer" target=3D"_blank">requests.api.post</a>&#39;<br>
&gt; +timeout-methods=3Drequests.api.delete,requests.api.get,requests.api.h=
ead,requests.api.options,requests.api.patch,<a href=3D"http://requests.api.=
post" rel=3D"noreferrer" target=3D"_blank">requests.api.post</a>,requests.a=
pi.put,requests.api.request<br>
&gt; +<br>
&gt; +<br>
&gt; +[MISCELLANEOUS]<br>
&gt; +<br>
&gt; +# List of note tags to take in consideration, separated by a comma.<b=
r>
&gt; +notes=3DFIXME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 XXX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 TODO<br>
&gt; +<br>
&gt; +# Regular expression of note tags to take in consideration.<br>
&gt; +notes-rgx=3D<br>
&gt; +<br>
&gt; +<br>
&gt; +[REFACTORING]<br>
&gt; +<br>
&gt; +# Maximum number of nested blocks for function / method body<br>
&gt; +max-nested-blocks=3D5<br>
&gt; +<br>
&gt; +# Complete name of functions that never returns. When checking for<br=
>
&gt; +# inconsistent-return-statements if a never returning function is cal=
led then<br>
&gt; +# it will be considered as an explicit return statement and no messag=
e will be<br>
&gt; +# printed.<br>
&gt; +never-returning-functions=3Dsys.exit,argparse.parse_error<br>
&gt; +<br>
&gt; +<br>
&gt; +[REPORTS]<br>
&gt; +<br>
&gt; +# Python expression which should return a score less than or equal to=
 10. You<br>
&gt; +# have access to the variables &#39;fatal&#39;, &#39;error&#39;, &#39=
;warning&#39;, &#39;refactor&#39;,<br>
&gt; +# &#39;convention&#39;, and &#39;info&#39; which contain the number o=
f messages in each<br>
&gt; +# category, as well as &#39;statement&#39; which is the total number =
of statements<br>
&gt; +# analyzed. This score is used by the global evaluation report (RP000=
4).<br>
&gt; +evaluation=3Dmax(0, 0 if fatal else 10.0 - ((float(5 * error + warnin=
g + refactor + convention) / statement) * 10))<br>
&gt; +<br>
&gt; +# Template used to display messages. This is a python new-style forma=
t string<br>
&gt; +# used to format the message information. See doc for all details.<br=
>
&gt; +msg-template=3D<br>
&gt; +<br>
&gt; +# Set the output format. Available formats are text, parseable, color=
ized, json<br>
&gt; +# and msvs (visual studio). You can also give a reporter class, e.g.<=
br>
&gt; +# mypackage.mymodule.MyReporterClass.<br>
&gt; +#output-format=3D<br>
&gt; +<br>
&gt; +# Tells whether to display a full report or only the messages.<br>
&gt; +reports=3Dno<br>
&gt; +<br>
&gt; +# Activate the evaluation score.<br>
&gt; +score=3Dyes<br>
&gt; +<br>
&gt; +<br>
&gt; +[SIMILARITIES]<br>
&gt; +<br>
&gt; +# Comments are removed from the similarity computation<br>
&gt; +ignore-comments=3Dyes<br>
&gt; +<br>
&gt; +# Docstrings are removed from the similarity computation<br>
&gt; +ignore-docstrings=3Dyes<br>
&gt; +<br>
&gt; +# Imports are removed from the similarity computation<br>
&gt; +ignore-imports=3Dyes<br>
&gt; +<br>
&gt; +# Signatures are removed from the similarity computation<br>
&gt; +ignore-signatures=3Dyes<br>
&gt; +<br>
&gt; +# Minimum lines number of a similarity.<br>
&gt; +min-similarity-lines=3D4<br>
&gt; +<br>
&gt; +<br>
&gt; +[SPELLING]<br>
&gt; +<br>
&gt; +# Limits count of emitted suggestions for spelling mistakes.<br>
&gt; +max-spelling-suggestions=3D4<br>
&gt; +<br>
&gt; +# Spelling dictionary name. No available dictionaries : You need to i=
nstall<br>
&gt; +# both the python package and the system dependency for enchant to wo=
rk..<br>
&gt; +spelling-dict=3D<br>
&gt; +<br>
&gt; +# List of comma separated words that should be considered directives =
if they<br>
&gt; +# appear at the beginning of a comment and should not be checked.<br>
&gt; +spelling-ignore-comment-directives=3Dfmt: on,fmt: off,noqa:,noqa,nose=
c,isort:skip,mypy:<br>
&gt; +<br>
&gt; +# List of comma separated words that should not be checked.<br>
&gt; +spelling-ignore-words=3D<br>
&gt; +<br>
&gt; +# A path to a file that contains the private dictionary; one word per=
 line.<br>
&gt; +spelling-private-dict-file=3D<br>
&gt; +<br>
&gt; +# Tells whether to store unknown words to the private dictionary (see=
 the<br>
&gt; +# --spelling-private-dict-file option) instead of raising a message.<=
br>
&gt; +spelling-store-unknown-words=3Dno<br>
&gt; +<br>
&gt; +<br>
&gt; +[STRING]<br>
&gt; +<br>
&gt; +# This flag controls whether inconsistent-quotes generates a warning =
when the<br>
&gt; +# character used as a quote delimiter is used inconsistently within a=
 module.<br>
&gt; +check-quote-consistency=3Dno<br>
&gt; +<br>
&gt; +# This flag controls whether the implicit-str-concat should generate =
a warning<br>
&gt; +# on implicit string concatenation in sequences defined over several =
lines.<br>
&gt; +check-str-concat-over-line-jumps=3Dno<br>
&gt; +<br>
&gt; +<br>
&gt; +[TYPECHECK]<br>
&gt; +<br>
&gt; +# List of decorators that produce context managers, such as<br>
&gt; +# contextlib.contextmanager. Add to this list to register other decor=
ators that<br>
&gt; +# produce valid context managers.<br>
&gt; +contextmanager-decorators=3Dcontextlib.contextmanager<br>
&gt; +<br>
&gt; +# List of members which are set dynamically and missed by pylint infe=
rence<br>
&gt; +# system, and so shouldn&#39;t trigger E1101 when accessed. Python re=
gular<br>
&gt; +# expressions are accepted.<br>
&gt; +generated-members=3D<br>
&gt; +<br>
&gt; +# Tells whether to warn about missing members when the owner of the a=
ttribute<br>
&gt; +# is inferred to be None.<br>
&gt; +ignore-none=3Dyes<br>
&gt; +<br>
&gt; +# This flag controls whether pylint should warn about no-member and s=
imilar<br>
&gt; +# checks whenever an opaque object is returned when inferring. The in=
ference<br>
&gt; +# can return multiple potential results while evaluating a Python obj=
ect, but<br>
&gt; +# some branches might not be evaluated, which results in partial infe=
rence. In<br>
&gt; +# that case, it might be useful to still emit no-member and other che=
cks for<br>
&gt; +# the rest of the inferred objects.<br>
&gt; +ignore-on-opaque-inference=3Dyes<br>
&gt; +<br>
&gt; +# List of symbolic message names to ignore for Mixin members.<br>
&gt; +ignored-checks-for-mixins=3Dno-member,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 not-async-context-manager,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 not-context-manager,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 attribute-defined-outside-init<br>
&gt; +<br>
&gt; +# List of class names for which member attributes should not be check=
ed (useful<br>
&gt; +# for classes with dynamically set attributes). This supports the use=
 of<br>
&gt; +# qualified names.<br>
&gt; +ignored-classes=3Doptparse.Values,thread._local,_thread._local,argpar=
se.Namespace<br>
&gt; +<br>
&gt; +# Show a hint with possible names when a member name was not found. T=
he aspect<br>
&gt; +# of finding the hint is based on edit distance.<br>
&gt; +missing-member-hint=3Dyes<br>
&gt; +<br>
&gt; +# The minimum edit distance a name should have in order to be conside=
red a<br>
&gt; +# similar match for a missing member name.<br>
&gt; +missing-member-hint-distance=3D1<br>
&gt; +<br>
&gt; +# The total number of similar names that should be taken in considera=
tion when<br>
&gt; +# showing a hint for a missing member.<br>
&gt; +missing-member-max-choices=3D1<br>
&gt; +<br>
&gt; +# Regex pattern to define which classes are considered mixins.<br>
&gt; +mixin-class-rgx=3D.*[Mm]ixin<br>
&gt; +<br>
&gt; +# List of decorators that change the signature of a decorated functio=
n.<br>
&gt; +signature-mutators=3D<br>
&gt; +<br>
&gt; +<br>
&gt; +[VARIABLES]<br>
&gt; +<br>
&gt; +# List of additional names supposed to be defined in builtins. Rememb=
er that<br>
&gt; +# you should avoid defining new builtins when possible.<br>
&gt; +additional-builtins=3D<br>
&gt; +<br>
&gt; +# Tells whether unused global variables should be treated as a violat=
ion.<br>
&gt; +allow-global-unused-variables=3Dyes<br>
&gt; +<br>
&gt; +# List of names allowed to shadow builtins<br>
&gt; +allowed-redefined-builtins=3D<br>
&gt; +<br>
&gt; +# List of strings which can identify a callback function by name. A c=
allback<br>
&gt; +# name must start or end with one of those strings.<br>
&gt; +callbacks=3Dcb_,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cb<br>
&gt; +<br>
&gt; +# A regular expression matching the name of dummy variables (i.e. exp=
ected to<br>
&gt; +# not be used).<br>
&gt; +dummy-variables-rgx=3D_+$|(_[a-zA-Z0-9_]*[a-zA-Z0-9]+?$)|dummy|^ignor=
ed_|^unused_<br>
&gt; +<br>
&gt; +# Argument names that match this expression will be ignored.<br>
&gt; +ignored-argument-names=3D_.*|^ignored_|^unused_<br>
&gt; +<br>
&gt; +# Tells whether we should check for unused import in __init__ files.<=
br>
&gt; +init-import=3Dno<br>
&gt; +<br>
&gt; +# List of qualified module names which can have objects that can rede=
fine<br>
&gt; +# builtins.<br>
&gt; +redefining-builtins-modules=3Dsix.moves,past.builtins,future.builtins=
,builtins,io<br>
&gt; diff --git a/check_whence.py b/check_whence.py<br>
&gt; index 711be36..4dfda90 100755<br>
&gt; --- a/check_whence.py<br>
&gt; +++ b/check_whence.py<br>
&gt; @@ -1,73 +1,102 @@<br>
&gt; -#!/usr/bin/python3<br>
&gt; +#!/usr/bin/env python3<br>
&gt; +&quot;&quot;&quot; check_whence &quot;&quot;&quot;<br>
&gt;<br>
&gt; -import os, re, sys<br>
&gt; +import os<br>
&gt; +import re<br>
&gt; +import sys<br>
&gt;=C2=A0 from io import open<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 def list_whence():<br>
&gt; -=C2=A0 =C2=A0 with open(&#39;WHENCE&#39;, encoding=3D&#39;utf-8&#39;)=
 as whence:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 list_whence<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 with open(&quot;WHENCE&quot;, encoding=3D&quot;utf-8&qu=
ot;) as whence:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in whence:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#=
39;(?:File|Source):\s*&quot;(.*)&quot;&#39;, line)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield ma=
tch.group(1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;(?=
:File|Source):\s*(\S*)&#39;, line)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&quot;(=
?:File|Source):\s*(\S*)&quot;, line)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield ma=
tch.group(1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;Li=
cen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r&quot;Licen[=
cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n&quot;, line<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match=
.group(1):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for name in re.split(r&#39;, | and &#39;, match.group(1)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for name in re.split(r&quot;, | and &quot;, match.group(1)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 yield name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match=
.group(2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # Just one word - may or may not be a filename<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not re.search(r&#39;unknown|distributable&#39;, match.group(2),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re.IGNORECAS=
E):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not re.search(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 r&quot;unknown|distributable&quot;, match.group(2), re.IGNOR=
ECASE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 yield match.group(2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 def list_whence_files():<br>
&gt; -=C2=A0 =C2=A0 with open(&#39;WHENCE&#39;, encoding=3D&#39;utf-8&#39;)=
 as whence:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 list_whence_files<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 with open(&quot;WHENCE&quot;, encoding=3D&quot;utf-8&qu=
ot;) as whence:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in whence:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;Fi=
le:\s*(.*)&#39;, line)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&quot;F=
ile:\s*(.*)&quot;, line)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield match.g=
roup(1).replace(&quot;\ &quot;, &quot; &quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield match.g=
roup(1).replace(r&quot;\ &quot;, &quot; &quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt;<br>
&gt; +<br>
&gt;=C2=A0 def list_git():<br>
&gt; -=C2=A0 =C2=A0 with os.popen(&#39;git ls-files&#39;) as git_files:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 list_git<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 with os.popen(&quot;git ls-files&quot;) as git_files:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in git_files:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield line.rstrip(&#39;\n&#=
39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield line.rstrip(&quot;\n&=
quot;)<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 def main():<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 main<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 whence_list =3D list(list_whence())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 whence_files =3D list(list_whence_files())<br>
&gt; -=C2=A0 =C2=A0 known_files =3D set(name for name in whence_list if not=
 name.endswith(&#39;/&#39;)) | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set([&=
#39;check_whence.py&#39;, &#39;configure&#39;, &#39;Makefile&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;README&#39;, &#39;copy-firmware.sh&#39;, &#39;WHENCE&#39=
;])<br>
&gt; -=C2=A0 =C2=A0 known_prefixes =3D set(name for name in whence_list if =
name.endswith(&#39;/&#39;))<br>
&gt; +=C2=A0 =C2=A0 # pylint: disable-next=3Dline-too-long<br>
&gt; +=C2=A0 =C2=A0 known_files =3D set(name for name in whence_list if not=
 name.endswith(&quot;/&quot;)) | set(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;check_whence.py&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;configure&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Makefile&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;README&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;copy-firmware.sh&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;WHENCE&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 known_prefixes =3D set(name for name in whence_list if =
name.endswith(&quot;/&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git_files =3D set(list_git())<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 for name in set(name for name in whence_files if name.e=
ndswith(&#39;/&#39;)):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(&#39;E: %s listed in WHE=
NCE as File, but is directory\n&#39; %<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0name)<br>
&gt; +=C2=A0 =C2=A0 for name in set(name for name in whence_files if name.e=
ndswith(&quot;/&quot;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(f&quot;E: {name} listed =
in WHENCE as File, but is directory\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for name in set(fw for fw in whence_files if whenc=
e_files.count(fw) &gt; 1):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(&#39;E: %s listed in WHE=
NCE twice\n&#39; % name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(f&quot;E: {name} listed =
in WHENCE twice\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for name in sorted(list(known_files - git_files)):=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(&#39;E: %s listed in WHE=
NCE does not exist\n&#39; % name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(f&quot;E: {name} listed =
in WHENCE does not exist\n&quot; % name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for name in sorted(list(git_files - known_files)):=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore subdirectory changelogs and=
 GPG detached signatures<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name.endswith(&#39;/ChangeLog&#39;) o=
r<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (name.endswith(&#39;.asc&#3=
9;) and name[:-4] in known_files)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if name.endswith(&quot;/ChangeLog&quot;) =
or (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name.endswith(&quot;.asc&qu=
ot;) and name[:-4] in known_files<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore unknown files in known dire=
ctories<br>
&gt; @@ -75,9 +104,10 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name.startswith(pre=
fix):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(&#39;E: %s=
 not listed in WHENCE\n&#39; % name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(f&quot;E: =
{name} not listed in WHENCE\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;<br>
&gt; -if __name__ =3D=3D &#39;__main__&#39;:<br>
&gt; +<br>
&gt; +if __name__ =3D=3D &quot;__main__&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sys.exit(main())<br>
&gt; --<br>
&gt; 2.40.1<br>
&gt;<br>
</blockquote></div></div>

--000000000000a6f7df05fbc1eabc--
