Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F68C3600B
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Mar 2025 13:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C03A4C4CEED; Mon, 31 Mar 2025 13:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9957C4CEE5;
	Mon, 31 Mar 2025 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743427077;
	bh=IBQWUUSNBAUe5Y+hs1LH4fa2wDqhogtXm7B1+2/+O4U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rwpcFBh6RcBkyOP3p1KdIp0VoKwUmWrRyoOyIs+hjvhf1sVlY9sSykSysr/1T+RnA
	 cZRWnwtJmGyHb0YJTmuSXK9LZRhDcievxOFUzC7xmZZ/ctaT65qQEQyEGktG9E5Tv0
	 2Hf8ANT5iVeHwOC6bffNJhBtldvyJq/tsTTi26NSpmFFNWu0jipBHNCiKuUrnp784+
	 nV6ITD2mNs6wC/vxhW10+qtIqxBhs3L253xcv3IrVmj85muPt4fW5G3C5APqwaDtQF
	 sp8u+sMqHAQQ9mSPGMi1Wpb2PDLYnPVnqd4O8th43UP+acoI6QKBQVXRliARmZBWsZ
	 8kstpQULnfuyA==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e63504bedd0so3117190276.0;
        Mon, 31 Mar 2025 06:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSMHoKuB5vZ9LVc1ETL9ZXd7kPa4uStrzzUZvPcyXqS7WAbcUjLzcFjI2V40TDJYM3Pw96fWwRZg==@kernel.org
X-Gm-Message-State: AOJu0Yyx0EEkRPC5PsdFZF7dkmKKNZKkIJYYRFPMxok1zqEhkHajlhMl
	DSNELAePcUaCLaHEugWxPC6AG8eCBpkuIcC4kkhaI2eKGiQwekT6Sy5M/+0qvq9QmE60nexdqSz
	TwYz1Qk1EhGQ5wAp9CAxe6buc0ds=
X-Google-Smtp-Source: AGHT+IGeQWRPAFcbBuQFdJQUY3fQjXJ+epLr/RQY1Kqyr4p2H+xbcJythJ77dxD+xlCi1EkkrxlKFjgujROzw4llYmc=
X-Received: by 2002:a05:6902:1615:b0:e6b:7939:e744 with SMTP id
 3f1490d57ef6-e6b83afd740mr11125174276.30.1743427076918; Mon, 31 Mar 2025
 06:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <kumGDjV7ju0cy6k0MkxvgQnOt8ak4IeW6jiFFVxlPcEqBLYv48PBBRsr6ketr42UHBC9rJtwzfl8_lbpGGBYLPw4vPoXBPtKYFDqdKs-Nr4=@pm.me>
In-Reply-To: <kumGDjV7ju0cy6k0MkxvgQnOt8ak4IeW6jiFFVxlPcEqBLYv48PBBRsr6ketr42UHBC9rJtwzfl8_lbpGGBYLPw4vPoXBPtKYFDqdKs-Nr4=@pm.me>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 31 Mar 2025 09:17:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7sMU0ifg-ommdiOVs6bG5qRPYPYrXZ4yGx8MAnweMdyA@mail.gmail.com>
X-Gm-Features: AQ5f1Jpu4gSwogsFFK7CfGnVFVAetnQg3haF_J3rX9KeRgS1g2ejgjQtimWyCrs
Message-ID: <CA+5PVA7sMU0ifg-ommdiOVs6bG5qRPYPYrXZ4yGx8MAnweMdyA@mail.gmail.com>
Subject: Re: Downloads not working for file linux-firmware.git
To: =?UTF-8?B?SmFrb2Igw4U=?= <jakob.ahman@pm.me>, helpdesk@kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Copying helpdesk for kernel.org

josh

On Mon, Mar 31, 2025 at 6:49=E2=80=AFAM Jakob =C3=85 <jakob.ahman@pm.me> wr=
ote:
>
> Hi, this (and other) link gives a 503 when trying to download:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/snapshot/linux-firmware-20250311.tar.gz
>
> From this page:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/
>
> Kind regards,
> Jakob
