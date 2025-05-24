Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9D7C54EDA
	for <linux-firmware@archiver.kernel.org>; Sat, 24 May 2025 11:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73952C4CEE7; Sat, 24 May 2025 11:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D575C4CEEE;
	Sat, 24 May 2025 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748084513;
	bh=jsOFI/3l7DI68xEW1jpWooo+c55YFp/WUqSMUC7U6gc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iXZAc2LBcVW8Fywka9T/Zjl2puikL4K+eRHRwLpX91hzjC3f1QVKwQt2vnQZgPNfk
	 r1GLLv3UacZJaf5/acGIcIGE2azadOes968G4shCn5MT/yLyvWD5HzuXfMFOt2sBVj
	 XkKZwrEaHKFkLvyS8XrX5R3rEg4c3mwJqj4VlMLPFzd5/KsB5mM0Nb759oflu3Au0X
	 yKkVf4x164nhY38avISdSkt119gNvellidFtjkFSFncHZYFIwkBFV3aiFzlumwrfYK
	 7wvMHSSW1e8orKBe3w8wKlolHic8V3LNma1iqlouWwiOF3Zff+HUAXIN/DkSCvsP7I
	 zAl539dy3iiSg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e302191a3so2714927b3.2;
        Sat, 24 May 2025 04:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbkGfKVNjmwWCDen03qJACKqBR7LfzDe26pDcHyOG1noQEPVqmggubXDkCm/bGaHVXpAJcwHeUNA==@kernel.org
X-Gm-Message-State: AOJu0YyNZnztN2rwZ77BzmFDyecRllGHqZ9hY28iDsUc1ZPWABhwU+Zf
	mAdhqU/pcs8uyyLjYxCPpuJcKRN80dTLu9s7GBvez0o9OVbOFW4Jiva0V03R8msVWTXykNw/t/y
	+lkyYyNfubLnsqCGFz9bNmj+a9P/Pu2w=
X-Google-Smtp-Source: AGHT+IFJVdZ543r+wIyn2Imhhh/2TGC+yMudMhDw1/AM/qAFP+N7wR+LWtgSrHl5DYBkEaNMuQIbk3KltwcTmicgV7Y=
X-Received: by 2002:a05:690c:921c:b0:70e:2fd7:de8 with SMTP id
 00721157ae682-70e2fd710d6mr10753577b3.29.1748084512607; Sat, 24 May 2025
 04:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
In-Reply-To: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 24 May 2025 07:01:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA61i6upJES0Ex+fu=3te0nL5C6UsBzwdqqG71=D9cFz0w@mail.gmail.com>
X-Gm-Features: AX0GCFtakdGE72uU9Nz4698nzxMe14QZAD3v4jd7XJvJegpl_2qLoV6ELz6n7T8
Message-ID: <CA+5PVA61i6upJES0Ex+fu=3te0nL5C6UsBzwdqqG71=D9cFz0w@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20250523
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/561

josh

On Fri, May 23, 2025 at 1:08=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit 3fbaee2775a4a6d44021aa035823a7388b0874=
fa:
>
>   Merge branch 'robot/pr-0-1747839277' into 'main' (2025-05-21 15:05:37 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250523
>
> for you to fetch changes up to 2e91d8c3c4bd34a27177180a38f62d3ba3c96031:
>
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.=
0_V2.0_SILICONZ-3 (2025-05-23 09:50:02 -0700)
>
> ----------------------------------------------------------------
>
> This is an update to the WCN7850 firmware that fixes the widely reported
> failures due to the prior version in ath-20250424.
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL=
_V1.0_V2.0_SILICONZ-3
>
>  WHENCE                        |   2 +-
>  ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6078528 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
