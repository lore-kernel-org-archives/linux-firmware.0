Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771AAE7315A
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 12:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DB01C2BC86; Mon,  2 Feb 2026 12:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4832BC116D0
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034583;
	bh=UhTs/LbGhMJCxYuwiT9NAy6P7QEKi/wKH9PExamfCVA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AtGvYrRB6XAPRWbxTmHfXrzFoIHOKHQ2A5RSMf38tXxAAcdogZTJiDkEcKflnhmRO
	 0jBtKE8cCmK44Uo2ACjHsKk69xfjH2efzslyohtxu2SBNoWOYF4RwK8gv3bDasL/QZ
	 SuXd/zocoGuPL+PLmn6bKbEpGhkVvpZagIHPlNGm4Er1x4dfq1d3uAXtM1Oj9TRwWA
	 Fl4XPtRnuAdqJgYole8S5G9O/41Sctlm6G9GQH0E12e/gIRgoaPhaszOAsQJQfkVvs
	 9pvjrMdP2TeiP2co63bVp3X4y7QVCyxjxD4Qoiw1w+JNWpOzGLYtl8uZAdUIlW28hC
	 evmPx9gJbZ8VQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-790884840baso39476617b3.0
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 04:16:23 -0800 (PST)
X-Gm-Message-State: AOJu0YzdF9AaQTdrc33TJk4xIteiFV56u6XRelAB4ZKtXAEstVVLO9uO
	6tZuVLXp5y7zBWPK5HzxwnKaxx8nj7kuRa0Wb5nkyXoY7+kq1EgkMpB5S1OmIF6TX2vkyH1deE6
	JgX2nnN4tL+YKmfDQCoDngIEYynGBYS0=
X-Received: by 2002:a05:690c:b1b:b0:788:763:179b with SMTP id
 00721157ae682-7949dfcb644mr102162537b3.45.1770034582459; Mon, 02 Feb 2026
 04:16:22 -0800 (PST)
MIME-Version: 1.0
References: <004201dc91fc$abbe3df0$033ab9d0$@opensource.cirrus.com>
In-Reply-To: <004201dc91fc$abbe3df0$033ab9d0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Feb 2026 07:16:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5rvk2yVAOSVO=HMnQVyLsNGPn+5_=GVoa3ZCVZap53MA@mail.gmail.com>
X-Gm-Features: AZwV_Qgb4qNrSR-JoQswNazKrb5rooqzpVO-ESLZ2w9IdMKYNUVlBIj8damH2nE
Message-ID: <CA+5PVA5rvk2yVAOSVO=HMnQVyLsNGPn+5_=GVoa3ZCVZap53MA@mail.gmail.com>
Subject: Re: [PULL v1] WHENCE: Correct 2 trailing whitespaces
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/898

josh

On Fri, Jan 30, 2026 at 10:25=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> Another little patch =E2=80=93 from Maciej to remove some trailing whites=
pace in WHENCE
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 5f391573e93d59823affa9785e19a5c9fe4c97=
99:
>
>
>
>   Merge branch 'robot/patch-0-1769587466' into 'main' (2026-01-30 14:42:0=
0 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware 20260130-WHENCE
>
>
>
> for you to fetch changes up to af03e44a2029a93ddc95dcf3c9e2ffabafad3fcb:
>
>
>
>   WHENCE: Correct 2 trailing whitespaces (2026-01-30 15:22:06 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Maciej Strozek (1):
>
>       WHENCE: Correct 2 trailing whitespaces
>
>
>
> WHENCE | 4 ++--
>
> 1 file changed, 2 insertions(+), 2 deletions(-)
