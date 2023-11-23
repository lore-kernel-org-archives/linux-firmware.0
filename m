Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208C5C27C40
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Nov 2023 00:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D06CEC433CB; Thu, 23 Nov 2023 00:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2F7C433C9
	for <linux-firmware@kernel.org>; Thu, 23 Nov 2023 00:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700697727;
	bh=o5GbEVHUU0U0QXOTArHF5+Dn6iBIxvrKU1BajDKL3zg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MCnodGUICDX8Xf6O+YdtdENlt8wDkOwD6VC3fR85h3/LO/ayZJOCojIucZHadmbJt
	 IoywE3s1UW74Oj46cywgs/tr118wfzSgtEDzwu9DDziHZ0qzllmmer7sQLfLMNOU2L
	 Oq96gfExGHKh+G/llIpsqsDOZKj8SUt4oaiTccqcNE9p53Pf7kV54zV+SXR75wGgk6
	 qs0dik8TLlQuhMCNqcvuyHHoAZ6WVbtFJBnhqaoCBgYvB3jtEkHmWlJ7Jduvr6/Fc5
	 zxRKvWLRyZ27qtI9dEpR6XKUgYkDACfb0eb/OPM+Af8kVs5NDu+Ip17HYwQK+g4ipu
	 zyzGqai9sIbFw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5b383b4184fso3581597b3.1
        for <linux-firmware@kernel.org>; Wed, 22 Nov 2023 16:02:07 -0800 (PST)
X-Gm-Message-State: AOJu0YwPrGY8wep/jQfyMcWUK572GDHOs/PR5eiZPfI2eDtIa4wS1aaF
	WednNZItx7I9hnvVTn8g1xcYRJUUzc0CLReMh4s=
X-Google-Smtp-Source: AGHT+IGtfgN4C3PEPbflKLspfGtWB6WIZt/3pLq8b/u9uV0c3RHe6z1thJ+tvEyWgSOY+3jvD2EO5eJFhCw8d9QxT/Q=
X-Received: by 2002:a0d:f182:0:b0:5a7:b53f:c304 with SMTP id
 a124-20020a0df182000000b005a7b53fc304mr3884782ywf.37.1700697726885; Wed, 22
 Nov 2023 16:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20231120084207.830-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20231120084207.830-1-jason-ch.chen@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Nov 2023 19:01:55 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5mvb3g8FOP+ULWTBYu5-cxpk4UMZ0=PF+tbTqJjcCurQ@mail.gmail.com>
Message-ID: <CA+5PVA5mvb3g8FOP+ULWTBYu5-cxpk4UMZ0=PF+tbTqJjcCurQ@mail.gmail.com>
Subject: Re: pull-request: linux-firmware: Update MT8195 SCP firmware to
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	yunfei.dong@mediatek.com, menghui.lin@mediatek.com, shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 3:42=E2=80=AFAM Jason-ch Chen
<jason-ch.chen@mediatek.com> wrote:
>
> The following changes since commit 7124ce30ba82266e3972e99aacebeda712131d=
6f:
>
>   Merge branch 'mlimonci/encoding' into 'main' (2023-11-17 16:54:55 +0000=
)
>
> are available in the Git repository at:
>
>   https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23033
>
> for you to fetch changes up to a41fa7c5008809ae360ce0808e378b37b1d6c0f4:
>
>   mediatek: Sync shared memory structure changes (2023-11-20 16:18:04 +08=
00)
>
> ----------------------------------------------------------------
> Jason Chen (1):
>       mediatek: Sync shared memory structure changes
>
>  mediatek/mt8195/scp.img | Bin 635492 -> 635448 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/68

josh
