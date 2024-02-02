Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70445C4828E
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27115C433C7; Fri,  2 Feb 2024 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1132AC43399;
	Fri,  2 Feb 2024 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876832;
	bh=touhaxaAdJle9IpRdiLb/BuCH/K63CXh37IPTsucA44=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FOfy3xkQuJLCa/8utMZ7Z+/l8979Nkn++NJ8oYq/+kY1EWZ/CBdeenmUp0HKzkaZx
	 +djF5TSbKE7ziPUibatTcIBDVNlVTJQdtvcbZz9GQTUlOmJ3dcIpEqe06Ra9U+Tsoo
	 pt/zAxVlBggVauirYFlNcvbec/VhGUus0WGAOOpm8ngJNhZf/2gMfFiUn3viA+9JWr
	 qEsa7moFgc5mT9c5EawszTnUgcqddr0APcKIYMR0IiLmdLWNpmG7ec5RIECuRMqTK3
	 N/5Q79CusYDU21aDq0c+Jb6napV8/QmdrNcqn2Okkzho0kD2GGK8OiCyhUnf6+2JXt
	 pTsQDW03IasLA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6041779e75eso21652207b3.3;
        Fri, 02 Feb 2024 04:27:12 -0800 (PST)
X-Gm-Message-State: AOJu0YzqVrig8Le6blGXN2T2/GIZccSmi8Nq41LoZ8FVv0f4r21WBXfi
	zTO+KoD+K5s73eOuTEl+JJMASK2hScBIl99Jupb0eELq4Xw1GbjZRChpX6A78wzCWzdKxnBzuRI
	sHLe2dxO6NrXUU0wGVheQaM1WJBM=
X-Google-Smtp-Source: AGHT+IGsOfXqhV/8fwaOfdUYofJMLh85JNkTrPVoVUFGs6T8y8xVasqQtpavtGo+pw0jUlR15wn96uhuUFl7ur7Nni4=
X-Received: by 2002:a05:6902:102e:b0:db5:6e6b:9b40 with SMTP id
 x14-20020a056902102e00b00db56e6b9b40mr2291792ybt.31.1706876831150; Fri, 02
 Feb 2024 04:27:11 -0800 (PST)
MIME-Version: 1.0
References: <8734uewvi9.fsf@kernel.org>
In-Reply-To: <8734uewvi9.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:27:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6hsTbSWRzyxv6a9yhKZUKA-zCKm2y+N0A+TEE3dMXt-Q@mail.gmail.com>
Message-ID: <CA+5PVA6hsTbSWRzyxv6a9yhKZUKA-zCKm2y+N0A+TEE3dMXt-Q@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 20240130
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:01=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Hi,
>
> We have one important update for ath11k WCN6855 which fixes a suspend
> regression reported by several people.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 1a9518c73c4b54854c9cd8f416fd3b8f8e3456=
e7:
>
>   Merge branch 'mlimonci/amd-2024-01-30.2' into 'main' (2024-01-30 15:55:=
30 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git =
ath10k-20240130

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/137

josh

>
> for you to fetch changes up to 5217b76bed90ae86d5f3fe9a5f4e2301868cdd02:
>
>   ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SI=
LICONZ_LITE-3.6510.37 (2024-01-30 19:58:18 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (1):
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V=
2_SILICONZ_LITE-3.6510.37
>
>  WHENCE                        |   2 +-
>  ath11k/WCN6855/hw2.0/amss.bin | Bin 4988928 -> 4988928 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
