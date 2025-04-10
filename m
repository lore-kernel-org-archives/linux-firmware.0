Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693BDC3601E
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Apr 2025 11:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2ED46C4CEE9; Thu, 10 Apr 2025 11:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189DDC4CEEA
	for <linux-firmware@kernel.org>; Thu, 10 Apr 2025 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744283217;
	bh=ZcUs4KUSDwSJEvIpBSWkGxb3u7plR1i1SQ0un1smHWs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DX0FRAvv7wKSy35NrknUKA/ETel+LOIKbS0DddaQaKiD5r0m7L0X1LpmILJz4OxDw
	 GeZaiMU6RCJ2dpR5dnAciFG8mowXH+u8aq7jnJwgVyMJyaKj9wynseJi/lg8ECX9zQ
	 RlG4sbR9cyLC2KTTzhEsuBrWPJP6zcZNfXZt+UXn+fUVKwz9dPP1lBIw9swZifCpGU
	 CbGAQElpaJdyaQZV3dCa3pdVEtlbChuBSN7Eq8DgXjaZMUaweeU2dXKdhpvLeQv8SI
	 qFNGT9v0rpDptshf/hthHi8YE2QckSTlNbi20Esyn6W0FOmWneAHGQdYtLrrK3TuWb
	 yWebfdtiMBiSA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6fece18b3c8so6695057b3.3
        for <linux-firmware@kernel.org>; Thu, 10 Apr 2025 04:06:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YwGB88KLwTJMEta5/M9+1o3lNNF2dhchkR3jkLjf/y3ynDsm7On
	sm1tABiazIkcdWsfFN1tLv+xbgPplevekD22cZI/n3w7Ft7p1xeIHdnXFMIlVt8311dasG330qR
	YFnGCGzk8oGGQ3f5GGaR0G81S1JE=
X-Google-Smtp-Source: AGHT+IF3oxVXVWz44DiQO92AYmdB6jJzsYFcSSMTpvjRPaWi1t1jhGNMkPofuei1U7PKmE+ETbKdoqplg1J6zOJBABM=
X-Received: by 2002:a05:6902:108f:b0:e5a:e8e8:b1b6 with SMTP id
 3f1490d57ef6-e703fb49ba3mr3220909276.8.1744283216267; Thu, 10 Apr 2025
 04:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <f7dLV-LegWvOvapaQgOMjBRu-9hCbLw6MXBvchvBUGJT68OuhCjrefUrbkQcY6ap898RWHfOvDH44pckHADOT_feRKfsd3xulQmsQp6DVZk=@proton.me>
In-Reply-To: <f7dLV-LegWvOvapaQgOMjBRu-9hCbLw6MXBvchvBUGJT68OuhCjrefUrbkQcY6ap898RWHfOvDH44pckHADOT_feRKfsd3xulQmsQp6DVZk=@proton.me>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 10 Apr 2025 07:06:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5t7cT7JwxHKRBaGvgOH40p85EBgfJmso59pNpjQ4w5Uw@mail.gmail.com>
X-Gm-Features: ATxdqUEjgo6RbZcSITphzDZ9lqs3gWrhuCBkvNKm1KM9V-uTgXdzYYRGulFnI-s
Message-ID: <CA+5PVA5t7cT7JwxHKRBaGvgOH40p85EBgfJmso59pNpjQ4w5Uw@mail.gmail.com>
Subject: Re: iwlwifi: missing ma-a0-gf-ao-* series since 2020
To: Tj <tj.iam.tj@proton.me>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:13=E2=80=AFAM Tj <tj.iam.tj@proton.me> wrote:
>
> The "iwlwifi-ma-a0-gf-ao-*" story is weird; Support for those MA devices =
was added to Linux in September 2020 in commit bc9296f4a828bd8 but the firm=
wares were never added to linux-firmware repository. The commit shows the d=
evice name set to "Intel(R) Wi-Fi 6 AX211 160MHz"

We'd need Intel to submit them.  There isn't much we can do as an upstream =
here.

josh

>
> linux-firmware only has the iwlwifi-ma-bo-* series.
>
> There are distro and kernel bug reports [0] and asks for this firmware in=
 various distro forums including the Intel community [1]
>
> [0] https://bugzilla.kernel.org/show_bug.cgi?id=3D218748
> [1]  https://community.intel.com/t5/Wireless/Linux-Firmware-for-AX211/m-p=
/1599943
