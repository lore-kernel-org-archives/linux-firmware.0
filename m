Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE6C52D6F
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Aug 2024 12:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50788C4AF10; Thu,  8 Aug 2024 12:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B309C4AF0F
	for <linux-firmware@kernel.org>; Thu,  8 Aug 2024 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723118456;
	bh=aA1a404vpAeF29nuOKr5/Qsxt+FO87tp2kjw3qGfRAI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TDKQnnm2sRVo4oSCQI0D6lLMJcs2UkDpJcM7uKNoe21dxd50pNwXQ/ZQQZ0e20I/d
	 49z0g6IPi21cgj9PktPTLQyxuIatS1Bj6TqUSDzsvMI5/FFEaF5yhZZPMFButdrDMa
	 9v6yhT/ZryxSTveepx6Wtqs9tCXE6JKZLDWiUUzKAZl6BijkaVEl4fnHH9ie4IE2fn
	 RAfY4j3o402Na2BfkXoOhjHLVYxvioKSOcQ+YzC2BRfUGTtFsc9pF45Y4Gfd1hUGaU
	 91X6PR9hyeMSLIsPrj3kmwzVoRixiFm07ylLxGCrriD+/NSKEuK67Am6zDXzaBhLjR
	 qCOj77FTLlo7g==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-66493332ebfso7579677b3.3
        for <linux-firmware@kernel.org>; Thu, 08 Aug 2024 05:00:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YxP801UTPKroi9b1y1hFHq1/Y3G3X6BEg5Iju3DtcC2lpHp04gR
	5ePS4OPzih98J6mlohPeq0mLyAxzkIQ3MDwKSJzoBtHjdfr8qJKOchkslzI5jhCPG+kkUmxLZ65
	m5ITC1JX6t/9MZNwnbDL1KvJA264=
X-Google-Smtp-Source: AGHT+IHGXUlCnjNavIQ2kkRMg2RIaPgYU8J+0k4tO8BlAguznSC2jxZiUVuYhtNWAJnkm+hlMOIIG7gr0OVdy3NCOEk=
X-Received: by 2002:a05:6902:1ac2:b0:e0b:e550:4e46 with SMTP id
 3f1490d57ef6-e0e9da6c99bmr1968923276.5.1723118455413; Thu, 08 Aug 2024
 05:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <bed2bbfb-f3f9-4562-8a7d-0f077f0f73a2@quicinc.com>
In-Reply-To: <bed2bbfb-f3f9-4562-8a7d-0f077f0f73a2@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 8 Aug 2024 08:00:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6bE79GcvPPBE3nhv3fG7yEX+L=JNuLiST8_jYZvrqkLQ@mail.gmail.com>
Message-ID: <CA+5PVA6bE79GcvPPBE3nhv3fG7yEX+L=JNuLiST8_jYZvrqkLQ@mail.gmail.com>
Subject: Re: Update WCN685x 2.1 Bluetooth firmware to 2.1.0-00642 request-pull
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 3:13=E2=80=AFAM quic_zijuhu <quic_zijuhu@quicinc.com=
> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit e131a437050360bf31b0ad7b69667432947acb=
ab:
>
>   Merge branch 'intel-20240805' into 'main' (2024-08-05 11:41:14 +0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/269


josh

>
> for you to fetch changes up to d6e21350fd265818799a128ba76e40b3fa6e8c5b:
>
>   QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00642 (2024-08-08
> 14:28:20 +0800)
>
> ----------------------------------------------------------------
> Zijun Hu (1):
>       QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00642
