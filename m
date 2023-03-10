Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3433BC64EC4
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Mar 2023 12:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECE1CC4339B; Fri, 10 Mar 2023 12:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7930C433D2
	for <linux-firmware@kernel.org>; Fri, 10 Mar 2023 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678452051;
	bh=lY9S0zrXorp5kptqZiPaM7iy202lr5SSG0HV9n8lHYA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ODBCwsqe8HLZaFA5SfIKTtCYJjKpPPqGlXhRmCRWDlNpDc85ONy63UEx4jNksufKN
	 UrKwpdseYq8E13m88ZyNyK4S2JEUtbmoDURZDYHc6Cw44isDts0s99xqEoMKPG5NLJ
	 b3MVd2Z5L6ckTgff48ZzC1v0H0vJu2D+qYb2zUfYMcjloDBQmlmWtKxxQSGlcby1Mx
	 O7qrGkgC4YOz7QWG0KecFjatxhWJ+jpSVa9ACmeAWT5BHEeGSQo0ThC5R2+kHAvPWT
	 Y+Mkx8aZOg3n8rFqXKBiVKu2k8waXLItO/ynXDMmG97AHupi0YheQNVISW8N7nhAVI
	 XTFoSwwKZbK6w==
Received: by mail-yb1-f170.google.com with SMTP id g27so1316118ybe.3
        for <linux-firmware@kernel.org>; Fri, 10 Mar 2023 04:40:51 -0800 (PST)
X-Gm-Message-State: AO0yUKWPBcYD3du9uIW9KWLHcnNxWxwxU18xp7ZKVwVxdFqAYS9MEdt1
	mOzERqYIs5WkbZt2A0iJQc9sJSKvNjUCyG29z8E=
X-Google-Smtp-Source: AK7set9NucRK93wVjnZmZOTk1B4dT6YgIKV5X/kRfc2FbRXifIrdVTYNXUlbbAMwpETd1zpi5W66cjYtfpGQ9MDSHq4=
X-Received: by 2002:a05:6902:4c1:b0:a4e:4575:f3ec with SMTP id
 v1-20020a05690204c100b00a4e4575f3ecmr12489827ybs.0.1678452050948; Fri, 10 Mar
 2023 04:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20230308191800.98791-1-fiona.trahe@intel.com>
In-Reply-To: <20230308191800.98791-1-fiona.trahe@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Mar 2023 07:40:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA71VEs7mvxyKpdU2Wsb1v0tRpNn0ShWqdF2C4VOia75jw@mail.gmail.com>
Message-ID: <CA+5PVA71VEs7mvxyKpdU2Wsb1v0tRpNn0ShWqdF2C4VOia75jw@mail.gmail.com>
Subject: Re: [PATCH] qat: update licence text
To: Fiona Trahe <fiona.trahe@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, giovanni.cabiddu@intel.com, 
	adam.guerin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Wed, Mar 8, 2023 at 2:18=E2=80=AFPM Fiona Trahe <fiona.trahe@intel.com> =
wrote:
>
> The same firmware is distributed with the qat out-of-tree package.
> Remove one unnecessary phrase in this licence to align with the licence
> used in the out-of-tree package.
>
> Signed-off-by: Fiona Trahe <fiona.trahe@intel.com>
> Signed-off-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
> ---
>  LICENCE.qat_firmware | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/LICENCE.qat_firmware b/LICENCE.qat_firmware
> index 9d94846..75a4ff1 100644
> --- a/LICENCE.qat_firmware
> +++ b/LICENCE.qat_firmware
> @@ -18,12 +18,9 @@ Limited patent license.  Intel Corporation grants a wo=
rld-wide,
>  royalty-free, non-exclusive license under patents it now or hereafter
>  owns or controls to make, have made, use, import, offer to sell and
>  sell ("Utilize") this software, but solely to the extent that any
> -such patent is necessary to Utilize the software alone, or in
> -combination with an operating system licensed under an approved Open
> -Source license as listed by the Open Source Initiative at
> -http://opensource.org/licenses.  The patent license shall not apply to
> -any other combinations which include this software.  No hardware per
> -se is licensed hereunder.
> +such patent is necessary to Utilize the software alone. The patent
> +license shall not apply to any other combinations which include this
> +software. No hardware per se is licensed hereunder.
>
>  DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>  CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> --
> 2.39.2
>
