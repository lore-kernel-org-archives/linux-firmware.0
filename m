Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF24C87FCF
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Aug 2025 12:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D16CDC4CEF7; Wed, 13 Aug 2025 12:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB73EC4CEEB
	for <linux-firmware@kernel.org>; Wed, 13 Aug 2025 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755088800;
	bh=TMGvcfS6kx0Q+JKOqdRJ+5p2owyfofvOarCbX41TupQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mA1Q1pLUgQBPbqwvSmNwdLTtE2xTUOChcQy9sYxvVZuyct3qQ8ty/IOnFdPGitPl5
	 F3OzBruifyE6UZYgYYJEToN/eu4MRbsY+FPBEMXS08gBQDPJCM5z5pc/SsqRd0fH2q
	 13b8Le8+KaTL+mQVfTnL2RuHG3R77BB9cFbtDY57iuTFzRkldeSPhtVltMuSWwFY9V
	 TXgQBM7p2l3nZr/Mcl8zkniCkMkoLyH29kQnsJzWVXT45X1/Fl3pzY1xvIzU3vc8WT
	 p1EWCFitsNaF4seLSjRm1mHvxe81dR5+ccXnr48p+KM3hPEe4c/Q291eLIoBfQ/kOI
	 uE+exwdIALRSA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71c075c3756so27326077b3.3
        for <linux-firmware@kernel.org>; Wed, 13 Aug 2025 05:40:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YxyCrYAcZHe1/VO0pb5iZotO28/UXg8HfLBHWH6D9VxLxFyqEJ9
	2y4PSx2v5/izvA0Ar2akkmPSvqjwPS5Rd12vfIYMES0L67uZwlew+YaudsVzslIyAp9Yk9/CCQM
	q37+DIbK72h+UcGY2bczscRgmTlPpfog=
X-Google-Smtp-Source: AGHT+IF8Me2HwTwZ6MIfhKgpI267IQPX2iJcW5chvuXesbjpPWlUJ+DVxSwlv7hllHpLXAcJLNQ0myUKJHvz9LgeBmw=
X-Received: by 2002:a05:690c:6483:b0:71a:27d2:2bdd with SMTP id
 00721157ae682-71d4e450d9dmr34671417b3.13.1755088799925; Wed, 13 Aug 2025
 05:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250813085807.1375181-1-shumingf@realtek.com>
In-Reply-To: <20250813085807.1375181-1-shumingf@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 13 Aug 2025 08:39:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6NmOTsAqxiL4hOQtcrOJg2hT16+1gK165LXY348g96LQ@mail.gmail.com>
X-Gm-Features: Ac12FXxKcXR0DAfnMRTIUANOJn_lEOsOt96y-6rrEACMl5Vkz-MyHrdjgQSd49U
Message-ID: <CA+5PVA6NmOTsAqxiL4hOQtcrOJg2hT16+1gK165LXY348g96LQ@mail.gmail.com>
Subject: Re: [PATCH] realtek: rt1321: Add patch firmware of MCU
To: shumingf@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, flove@realtek.com, oder_chiou@realtek.com, 
	jack.yu@realtek.com, derek.fang@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 4:58=E2=80=AFAM <shumingf@realtek.com> wrote:
>
> From: Shuming Fan <shumingf@realtek.com>
>
> This patch added the patch firmware of rt1321 MCU.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  realtek/rt1320/rt1321-patch-code-va.bin | Bin 0 -> 7232 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 realtek/rt1320/rt1321-patch-code-va.bin

You're adding a new file but you did not add it to WHENCE.  Please fix
this and run check_whence before you submit patches.

josh

>
> diff --git a/realtek/rt1320/rt1321-patch-code-va.bin b/realtek/rt1320/rt1=
321-patch-code-va.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..a9b9d50e19bdcf21cdf8095d2=
6107f3142f3a12e
> GIT binary patch
> literal 7232
> zcmXZgcf42g9|!Q$ya}alWE8h<WQ2&WnXImzoxMW#R<>JFcJ>~Zki9}S8QFVe%j()f
> zWajsL{e1p<en01Z&+GF#qkF%Ps-|jz5mi;SViQ{vRhwd4)>^k?4cjw6P*dg|SZ_TK
> zC$J-1I4|dNKIZ)Sne#ibKRXlIbb*QN!kpigIlq=3DUzZ)C4AjfkdqUz3kSeR3|2y@<|
> zWxiOM_h9z#$?U&4ld}XHS;zG6#oO4M$*Jcw_F?v4k~wcFqUy_hSenUShBaK4ja-hK
> zvmcYcJn!HNY~hMbet#x^B_@Amq8h+_ScS=3D7mB}AiY~VK5t1<bj^E$4<<gdvOxfYYZ
> zHj_VysMcXV3}*7zW%Ac6uFu`9H(>HN<n<iF<TvtTZp7qo%;axERGTs%He>QPXY#iw
> z4&`9$Et&kScoVl~^0(n^Zp-9v$K-EMRKu7LJ23e>GWk2Pkvnre?!x5n${V>GlfOHE
> z=3DN=3DrvJ=3Dw&)h-!GTI_1CpTXDMMt(ke7Vq1>2ZpXfC&l=3DXSksUaN^RPWTvK8kgs`)s=
X
> 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
> IsOpRV16vyXiU0rr
>
> literal 0
> HcmV?d00001
>
> --
> 2.34.1
>
