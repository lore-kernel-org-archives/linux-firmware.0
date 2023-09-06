Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2FFEB8FA5
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 10:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE4F7C433CB; Wed,  6 Sep 2023 10:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C8DC433C9
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 10:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693997553;
	bh=zyz7GhJxnCjg7T5CX81Z7JYheTASRgKR7Yceivx00d4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iMIsjCBwP7Br8BthChV9kE0Qr54F5bHkIwd2Dyg5iDfeen30naPeAylduqQXXAGz8
	 eAKbUX/tiMXFnvVZeBFli/mjIeHV3QkAjkZt+WHPzU44BqeC6/N2iLdJ1I691+aJ8y
	 lE6FLjMNc9e5Gw+kf7QJnrPyQHJe2Bzifaf9f2ptcjXwUyNjRgE5eWcdSAtZVJVU75
	 1gjUj8QZf2yTJ+CacbdGPlKPk8GvBIjeicMXwMbwBapOXTocWq3/qVS709q4Ew6yrZ
	 3S79GVWbVKdtVt/oLIufarcOfqI+uqsTignYWSuSUvd/oFXUfer5PzhxmjE2/bWW8a
	 nLMAeNOwoVNyQ==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso1126873276.0
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 03:52:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJy5wSQfSJ01jlegf6LedUb/ScemxurEevipK6/MKqbwXqRLjY
	65UQH33KKw0ECrqhsR1BxDoMeQZd5T3jlkK0M44=
X-Google-Smtp-Source: AGHT+IEMdHomw3SXh9o1msJgBXfRdE8Cqbif7ENExg2VFDA5wG0AFclbPOJp5O7hHS6KVUXCP9YogQDMOTHo4NISe1k=
X-Received: by 2002:a25:2654:0:b0:d7b:9ce0:c8c9 with SMTP id
 m81-20020a252654000000b00d7b9ce0c8c9mr19978680ybm.9.1693997552818; Wed, 06
 Sep 2023 03:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com> <20230901065226.13607-1-juerg.haefliger@canonical.com>
In-Reply-To: <20230901065226.13607-1-juerg.haefliger@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Sep 2023 06:52:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA61B=HpM_WhOxyJ0O_VYNbS=h6OMSm50hr2faDQanipsQ@mail.gmail.com>
Message-ID: <CA+5PVA61B=HpM_WhOxyJ0O_VYNbS=h6OMSm50hr2faDQanipsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Support RawFile in check_whence and update WHENCE
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: mario.limonciello@amd.com, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 1, 2023 at 2:52=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> This series updates check_whence to understand the RawFile keyword and
> updates WHENCE to use that for currently known firmware files.
>
> v2:
>   - Rebase to latest upstream.

All applied and pushed out.

josh

>
> Juerg Haefliger (3):
>   check_whence: Recognize RawFile keyword
>   WHENCE: amd-ucode: Use new RawFile keyword
>   WHENCE: Don't compress qcom json files
>
>  WHENCE          | 47 +++++++++++++++++++++--------------------------
>  check_whence.py |  6 +++---
>  2 files changed, 24 insertions(+), 29 deletions(-)
>
> --
> 2.39.2
>
