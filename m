Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C20C83F12
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D4D8C433CA; Mon, 28 Aug 2023 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D86C433C8
	for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693221221;
	bh=jN35eGNQaBVQL++4c0vGh4Hwtm3JcRJXlQ+3QGvys8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nXfizmRqVBWs1MOGvydAOdbzV+vDve9JbHawFA4CWPlsyUbCRxD1ln+LgLgY947Wh
	 19rd4PoDyPwsv0pwgpd6Pto87n0TBlb9kWxJdVnDp6N3x6lby7esZU1M886OEuFjt/
	 k/Bs5at+9X6No/LT4orD17/5I9TeOH6bOXV6PxN/vieQKzefGMOjSFIUTUbRwOAhkp
	 8KScNZTz2r+XC1zHsIrCK44DsR4Tw5hU2LpsVU/gvnoLNDA5aqUPWwUqwb6sHyKbLN
	 SgSVgrBQkbFVxHh5rFiKYr4J4D/XH8tmui3Ahxf/b0wUDh8T2nOs0TLWX4R5GS1f+A
	 X0any/GnDvgPQ==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d746d030a86so2935271276.1
        for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 04:13:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxz5ASV9DPrymXVUmVmFkXtbtgnBw7KzW+ARg3H0oSdq/6BwLhc
	0UKCAATDoPNR4Pl2TQxgPHMeTKwqINwh3Z51+oc=
X-Google-Smtp-Source: AGHT+IFTgfxaaHOkneeYaWlfAL2OzU/2P3diwkRqh9UKN2KCZ0nZBKx/qxckuzKVJ0AS8clxPSFQ3DYuHMktHhBJF98=
X-Received: by 2002:a05:6902:4c8:b0:d77:fc48:9812 with SMTP id
 v8-20020a05690204c800b00d77fc489812mr11184784ybs.12.1693221220106; Mon, 28
 Aug 2023 04:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <65ae8880b5ed2ed726256c8954bb0e457e75b950.camel@realtek.com>
In-Reply-To: <65ae8880b5ed2ed726256c8954bb0e457e75b950.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Aug 2023 07:13:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7w5k+MDsHykN3ofDwmS5i=s2+CXAmG2iZH=GYsUeZ1+w@mail.gmail.com>
Message-ID: <CA+5PVA7w5k+MDsHykN3ofDwmS5i=s2+CXAmG2iZH=GYsUeZ1+w@mail.gmail.com>
Subject: Re: pull request: rtw89: update 8851b and 8852b firmware to
 v0.29.41.2 and v0.29.29.3 respectively
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 2:36=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> MBSSID number could potentially exceed array size, so update firmware to
> fix the problem for 8851b and 8852b.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 0e048b061bde79ad735c7b7b5161ee1bd34001=
50:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-fir=
mware (2023-08-14 13:03:41
> -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to ef41ae8f653c302f71ae100f864630a3b6610512:
>
>   rtw89: 8852b: update fw to v0.29.29.3 (2023-08-25 14:29:52 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (2):
>       rtw89: 8851b: update fw to v0.29.41.2
>       rtw89: 8852b: update fw to v0.29.29.3
>
>  rtw89/rtw8851b_fw.bin   | Bin 1161008 -> 1160984 bytes
>  rtw89/rtw8852b_fw-1.bin | Bin 1184992 -> 1237704 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
