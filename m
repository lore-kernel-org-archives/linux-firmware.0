Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A0BE7315B
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 12:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E8A6C2BC9E; Mon,  2 Feb 2026 12:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39410C2BC86
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034685;
	bh=Q9S143qc4geSEoa38dOvihqhHcyZjaqCDcdK6FY5rbs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CgT3ufDyOkGVVu9tzejwmAGYdLxVwniqXkpimzsff7pYZCqh5zDYHIsgQsuc2oNwk
	 moMtTmFsc3wxvbjME0ARwATW0MxaoPMeSyCXesi4WGA+1GEzxGhWCOwBAqc2L9EAn7
	 eQOa8Rpuxq8uFZZzyHyk0+our4ZJNGRDY0u3tUd2ZT82nfuSIDCRpdniyJ+bKxCmiL
	 NOBgKYcv/nYkNGNVgOyLS+MR1THp9Pc5flZgVC4BDVlJUBuOivK/iKbCxh4zPk4JbX
	 ZSPhiSTaBX807chtvX8DJ7W29QJ4wTQSOtaE4/dbk+myUezMlzUUcof5pzNXUyUZQR
	 0n7+RT2zzCzuA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794e95357cfso1154587b3.0
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 04:18:05 -0800 (PST)
X-Gm-Message-State: AOJu0Yxe1gWXQfTvLUu9Ors6HDpjyzVGOaigCxY6/B4K5WLUNda1af/T
	MiuZewuA/oLv8n+hevzrbXlvaMH7nyl/IUh+40Ius/hk+K1LfVsVENJCDwAnFCM4d5FtRf71WzF
	pG3GLwHLDFszASpFLReywuRz19IauSVU=
X-Received: by 2002:a05:690c:63c8:b0:794:84ee:9aa5 with SMTP id
 00721157ae682-7949dfd9c21mr86717237b3.47.1770034684436; Mon, 02 Feb 2026
 04:18:04 -0800 (PST)
MIME-Version: 1.0
References: <000001dc9142$64f4dbf0$2ede93d0$@opensource.cirrus.com>
In-Reply-To: <000001dc9142$64f4dbf0$2ede93d0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Feb 2026 07:17:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4shWEX-9NtyV+SEw5XWszyfsn7p5wD=vQb9=4h-oAUxw@mail.gmail.com>
X-Gm-Features: AZwV_Qi64ONZVr3tFV4XhsxCLwDIUE1pfmveRUldlKkv1_mAVp8fgucPrh0mZ6M
Message-ID: <CA+5PVA4shWEX-9NtyV+SEw5XWszyfsn7p5wD=vQb9=4h-oAUxw@mail.gmail.com>
Subject: Re: [PULL v1] cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/893

josh

On Thu, Jan 29, 2026 at 12:12=E2=80=AFPM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> One little patch today =E2=80=93 we=E2=80=99d like to add some Links: to =
address an issue discovered on a Lenovo laptop running Kernel v6.18
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 2e5a8b0550ba3255bccc2bac57c520259968f5=
e9:
>
>
>
>   Merge branch 'main' into 'main' (2026-01-28 02:12:22 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware 20260129-cs35l56
>
>
>
> for you to fetch changes up to db024df1e153c8fd5d3c7f79ce5ad08f09c10f64:
>
>
>
>   cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware (2026-01=
-29 17:05:41 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add WHENCE links for 17aa233c spkid0 firmware
>
>
>
> WHENCE | 3 +++
>
> 1 file changed, 3 insertions(+)
