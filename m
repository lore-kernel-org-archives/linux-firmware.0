Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF39AC4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Nov 2022 15:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94A18C433B5; Thu, 17 Nov 2022 15:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C416C433D6;
	Thu, 17 Nov 2022 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668699821;
	bh=9nDHZDuJyea3HNTaazA92H6Gk2lkj9NzwUrPllJxVDU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fSaZ24Y+qATfU01g1gCdAWvy9iqFEFjBACTfnbT0SWq1C4dixM/dZJ3sIEB2wc7rn
	 g1AnAfEEdgvhPYgNiL2wTvxEyT4/BWk7Ju6nPhNWlWo9+TGjQbwYK/Niu5nflC7aZG
	 X38te3p8p4sQ29RDUby6vBbPJlE1ZbGTog5TryRW6qSMrDoVTuSmNxmpZLqeFFRTwY
	 SqtUZ2EQ680LAer+prTmvAXyidZzbEWzg92l2bxwQoUuXYBnYtwvibfLPbUeO7SMKC
	 fu+Xa4X8HccRFy0jpGBcpmnTCWFOm8QOlNPGPT2/FKu0oCNmN+wt/pUdcL3HcBVpJo
	 rfmz/ZOCXPtPQ==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-142306beb9aso2542517fac.11;
        Thu, 17 Nov 2022 07:43:41 -0800 (PST)
X-Gm-Message-State: ANoB5pktbi28U0IG82JDTJx1a202KxVOMpdWv9d3EYqyUbcIkikVI6yH
	WhAyCm/Io8nkiOi8goUFBNr8gRYQO6hYJw9wWp8=
X-Google-Smtp-Source: AA0mqf4bnEBmub5JQgyhpk5X7Fj1SPgf8WMT385qVIRA7n52nAtODIfOdAC8eAAmLrU6I5c7D7HTSANLglp6P9QSDcs=
X-Received: by 2002:a05:6870:8a28:b0:13b:b528:1b8e with SMTP id
 p40-20020a0568708a2800b0013bb5281b8emr1652971oaq.3.1668699820611; Thu, 17 Nov
 2022 07:43:40 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_Pp5h1R+vZGCORrbsV0Nc1PMaVTaa2KmJus3X4hZjmy9g@mail.gmail.com>
In-Reply-To: <CADnq5_Pp5h1R+vZGCORrbsV0Nc1PMaVTaa2KmJus3X4hZjmy9g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 17 Nov 2022 10:43:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7CEcGHXzPALuA74m3nVryWZ_UM-RsK2T5jTLMHqDZmgg@mail.gmail.com>
Message-ID: <CA+5PVA7CEcGHXzPALuA74m3nVryWZ_UM-RsK2T5jTLMHqDZmgg@mail.gmail.com>
Subject: Re: Updated AMDGPU firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Nov 17, 2022 at 10:34 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated DMCUB firmware for green sardine.  Please apply!
>
> Thanks,
>
> Alex
