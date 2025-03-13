Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF65C282DE
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Mar 2025 11:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4ADAC4CEEF; Thu, 13 Mar 2025 11:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D55BC4CEEE
	for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741864465;
	bh=MMAN5UukwszNC6OHq5Y2iwjj+lOyMoN19ukxMCfVP20=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZjTjOW0o4jBmqa8YelechOpEsyQFBfG07GUHchS8ZQ0vIjCwJbJFA7uu7vXNwVxVq
	 x9JxLA9iYqmXVeFHaajzzjT1J7VKCOKilS+AXD4RTU2a+MUFvwLkjFRekcoD/5kaoY
	 gG6zBV7byOYwkepI0XODUTgy2TM7PN36pM2/wJX3DeMnraAEX1x5wdTYmHBI03UPPN
	 xcUyqpmJDQBKDkJkrWgO4HEY99Ru9kM/Q2h0Ln9z0gwRRaFzrySOwZt3flehaTej1s
	 truKZsu1YucasPV3acJ5XF1yRtrFdAhwqT8wjkvH+UPfGrbTijSY9P8RLJEjl5My+E
	 f+bCngs4B8zjQ==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e589c258663so768093276.1
        for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 04:14:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YxyFQDOzy4aF4mLEKrReDaSjBuuJ3Ot+Kgq+6bam33zlLNp7VGh
	DblrHV7baOmlX4ODJf4cfmpZbz6tbJRAr1JPdwkskkvRd2m3T+mKLD0IqVcrvcVzeVTTU5YBlKO
	z+2DjSYM0qOsR5OxUmRmJE7/5iGM=
X-Google-Smtp-Source: AGHT+IGYyQDgPTkeMu+sJH0m+8ZEXNvRWPeepNz6z2cwJgnL2Z8cyAqPL2Zgw+v9DKFEmtJOu3mVqdcrnZgdtvfj5cc=
X-Received: by 2002:a05:6902:cc7:b0:e60:a903:3f41 with SMTP id
 3f1490d57ef6-e635c18bde4mr33147333276.24.1741864464646; Thu, 13 Mar 2025
 04:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <6784cbe4-7afe-48ca-8d74-e30339c72ca9@RTEXMBS04.realtek.com.tw>
In-Reply-To: <6784cbe4-7afe-48ca-8d74-e30339c72ca9@RTEXMBS04.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 13 Mar 2025 07:14:13 -0400
X-Gmail-Original-Message-ID: <CA+5PVA49wRjKvSFk_7qSVWuS-tzL7qk+LRMwERY_D8WUcgBx0w@mail.gmail.com>
X-Gm-Features: AQ5f1JoooDTrFwiUd69dOJJzUXuFu2s3b4CitFccyfiU2W4Q1ttGcWc5LD5Uuu8
Message-ID: <CA+5PVA49wRjKvSFk_7qSVWuS-tzL7qk+LRMwERY_D8WUcgBx0w@mail.gmail.com>
Subject: Re: pull-request: update rtw89 fw for RTL8852C and RTL8922A
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	damon.chen@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/480

josh

On Wed, Mar 12, 2025 at 11:02=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> =
wrote:
>
> Hi,
>
> Update firmware of rtw89 divers including RTL8852C and RTL8922A with
> support of secure boot.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit 89ba9b7ce05c8dac3b659b6a0ebc87a601fc35=
b1:
>
>   Merge branch 'robot/pr-0-1741722400' into 'main' (2025-03-12 13:09:10 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-03-13
>
> for you to fetch changes up to da086994b2ad7ca25167baa78cd0a5385092c584:
>
>   rtw89: 8922a: update fw to v0.35.64.0 (2025-03-13 10:58:03 +0800)
>
> ----------------------------------------------------------------
> Kuan-Chung Chen (1):
>       rtw89: 8922a: update fw to v0.35.64.0
>
> Ping-Ke Shih (2):
>       rtw89: 8852c: update fw to v0.27.125.0
>       rtw89: 8922a: update fw to v0.35.63.0
>
>  rtw89/rtw8852c_fw-1.bin | Bin 2375560 -> 2399272 bytes
>  rtw89/rtw8922a_fw-3.bin | Bin 1725278 -> 1188926 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
