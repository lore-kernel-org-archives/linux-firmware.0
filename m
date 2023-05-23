Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664BCC7EE23
	for <linux-firmware@archiver.kernel.org>; Tue, 23 May 2023 17:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 255D5C4339E; Tue, 23 May 2023 17:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D07DC433D2
	for <linux-firmware@kernel.org>; Tue, 23 May 2023 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861575;
	bh=fdWaJRAMwEZc6Sd/5O8zJRtj84LuwkHB7pSwVdhk5Uc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=S4qqPlozBlf4MBCvP9PQzk2aiRlUI4cRu930TT4fI4QB4ooDarbscLejc5vafieHw
	 d1fVWsEoDcZw2VqpzRyZM9O75dx6iYCfb1XqFYb/0eRZYTNLNMo1UgEp4NqCreGQEO
	 Lsk3b6wwk07fYKj1P28d6A3icDwfUVaNT5Kd2wXOMelldTlWJEG0bk+brHSDHbXHvL
	 fzzKNcvoaMfeG1cTYcqeaq65NqZn5T7WPdIpdI6tCOSQSkLibnCZf8vmg63t4KOMH0
	 QD0foT4VC5jSRTqN+fvo9nWI+nmUWSsJ764a7miAxewYo1Zn/dITvth5WVt18Uz4JN
	 ICB7h9umqEPHQ==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ba829e17aacso11532702276.0
        for <linux-firmware@kernel.org>; Tue, 23 May 2023 10:06:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDyWHuGxfEl34mhl24AIDgCgDy022GffnSZliWbEldLQ43hygWBm
	ltCbcwx3C6dfINxpmG05fv5tBBiSQnuRwaksiC0=
X-Google-Smtp-Source: ACHHUZ7w1u52PT2eBR9TiDY/I/+gQlFcP8VA3nAXa/8NGSU+Ra/tioSpbEESsL5wvCeX74hI5t6VIHUVlCgQ/X+b4/o=
X-Received: by 2002:a25:abc9:0:b0:ba1:e06b:bc57 with SMTP id
 v67-20020a25abc9000000b00ba1e06bbc57mr13239853ybi.64.1684861574089; Tue, 23
 May 2023 10:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR12MB51440AF69145CC836C5A137DF7409@BL1PR12MB5144.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB51440AF69145CC836C5A137DF7409@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 May 2023 13:06:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5vCa+3wPPPjzs-SMWEhHig2VXd_gLAEpgmc4VAD=P1Dw@mail.gmail.com>
Message-ID: <CA+5PVA5vCa+3wPPPjzs-SMWEhHig2VXd_gLAEpgmc4VAD=P1Dw@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 11:42=E2=80=AFAM Deucher, Alexander
<Alexander.Deucher@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> Updated firmware for amdgpu.  Please apply!  Jay sent out DMCUB firmware =
in a separate email.

All applied and pushed out.

josh
