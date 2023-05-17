Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99447C77B7F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 May 2023 11:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F8ECC433D2; Wed, 17 May 2023 11:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FD4C4339E
	for <linux-firmware@kernel.org>; Wed, 17 May 2023 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684323784;
	bh=ZmdT3WXK5Mu/G8Igr8sZKnTdT4ZPN25u/kh1/SWx/bg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ie4ocXqgjfO8bb3t9OLBr3+te153yzQhbm164yZVNK63VaRWzNhhYT9QqY8by+80U
	 YFdhW+KcQUvNsvacBoI11SI0JIqqx/DF6oTJkonfSjkknQdHTQgPuZEiNN06wjEC3+
	 wmA+YP9FCFMW6y4rf4ZQScBKwgRrnolSRNzOjGSgkxYnnyQslwZiTRedOZpzDHp82Z
	 0+MxFuenz6hZ/FnDeZMBLdqj7tKIoFV8byjNxedo6QaVvfSnXAm3zShUdT0Kgh09Sj
	 o75BxB7kq2xWKEe1gjiK25/YPMHKYWY5TUKzjgSWctPm34ONUigYBc44YDNNJ4U7/m
	 8iXMqFiDoYbKg==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba7730e47a4so798908276.3
        for <linux-firmware@kernel.org>; Wed, 17 May 2023 04:43:04 -0700 (PDT)
X-Gm-Message-State: AC+VfDzGMWckqOH3qAxKvFKoj+qhtNqJUtBNqNkBj5fqsDWk3ak2iE+X
	varQhFFgMa/6hvcrjriedqU9r7S/G5kQhOr/a9w=
X-Google-Smtp-Source: ACHHUZ48IlP5OVedZiMBCTM3xbpXNxtYPH0HEDGDV4i+UfHWbpWeHJJ6Fp5fCQPRijiPnDzkcKMpCt6GfEHVONdqAhM=
X-Received: by 2002:a25:21c1:0:b0:ba7:4134:87b9 with SMTP id
 h184-20020a2521c1000000b00ba7413487b9mr12408605ybh.51.1684323783391; Wed, 17
 May 2023 04:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <97eb7e849c46445180f6e77d565f831b@realtek.com>
In-Reply-To: <97eb7e849c46445180f6e77d565f831b@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 17 May 2023 07:42:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA61CDnv3ZwtvOzXPSh87TPEd6epW9gO2gU6HFHWyp_5bw@mail.gmail.com>
Message-ID: <CA+5PVA61CDnv3ZwtvOzXPSh87TPEd6epW9gO2gU6HFHWyp_5bw@mail.gmail.com>
Subject: Re: pull request: rtlwifi: update firmware v6.0 for RTL8192FU and
 v28.0 for RTL8188EU
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 10:51=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> =
wrote:
>
> Hi,
>
> Update firmware for chips newly supported by rtl8xxxu.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 512909428e46953e4ade391387aef1305f5202=
9c:
>
>   Merge branch 'main' of https://github.com/CirrusLogic/linux-firmware (2=
023-05-15 13:24:26 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.  Thank you.

josh

>
> for you to fetch changes up to 08b854f020666a5df3d1987f6c01c8c2b780de7e:
>
>   rtlwifi: Add firmware v6.0 for RTL8192FU (2023-05-17 10:09:36 +0800)
>
> ----------------------------------------------------------------
> Bitterblue Smith (2):
>       rtlwifi: Update firmware for RTL8188EU to v28.0
>       rtlwifi: Add firmware v6.0 for RTL8192FU
>
>  WHENCE                  |  23 ++++++++++++++---------
>  rtlwifi/rtl8188eufw.bin | Bin 13904 -> 15262 bytes
>  rtlwifi/rtl8192fufw.bin | Bin 0 -> 32416 bytes
>  3 files changed, 14 insertions(+), 9 deletions(-)
>  create mode 100644 rtlwifi/rtl8192fufw.bin
>
