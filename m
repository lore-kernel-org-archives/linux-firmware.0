Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429D5C87FD2
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 11:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1ABF8C4CEF9; Fri,  8 Aug 2025 11:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04241C4CEED;
	Fri,  8 Aug 2025 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754653561;
	bh=YwgJ4W0yz/3U7CZDEb+pmN3xlnIzTMSoc9qyKFnxOfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=I8NYN2fmgNFMtr67TFvKJS81k2mk4lRbgU/aLVNCBloZ2ky0dgUaPt59EWfC6HdGY
	 myj+Ny8SRdQfBSuW9xdKj3MHfkI+zOIT/rbEWpUNuj0Y7PwuRIj36Azdu9oXi8wvEt
	 5UxHWDlt1PcTiWrVuA8Vlva7f0c+6JtujG8hGEfqB9XvzClEgqhzS0RH/10PdwOZ1l
	 wsKWRh4lygemJzHFP+jP2/7+eILqVqe/I5wlwLQZzx/mNPu2OiZWxy1bo/ELAVWW3m
	 pJP/DhM9fsPVUIHTyToHxm5xGI4vCkWHgQ4YYee0NaWE+YkQwLnCnMrgqzJMEBVD5i
	 9/8PJa2xRkxgw==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e902849978bso1592176276.1;
        Fri, 08 Aug 2025 04:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmQDBQHdS8rgm2rTtiJxpCYT6BBryf+6WG7BdMOmHrjQUU60lTk64D1o1ZCHU3T2NXIWl5QSfulg==@kernel.org
X-Gm-Message-State: AOJu0YzyXf0NeiZmE5OcZjSxqMQd65zJwP1HvnWu+425OOdeqbW0FfiU
	F6+1je0dZiWMCawZs5yWGcjyyE4zBnsS0MKU7CcmuAlzgYlUzDkQ/jcMsUmsQaOPjPcWkUJS0W6
	dLS3jJmxpYi3hEicDm4T3KN4YBvlCBvU=
X-Google-Smtp-Source: AGHT+IFFl8Yogl/jKz3XpUVYcblZSE0Vjd1MxzRMkjBSnZJloREpmQubm0b1JY7EOyr/OXIxMNRYZLiJ0sdD+ACvgdI=
X-Received: by 2002:a05:690c:4989:b0:71b:6c7b:c802 with SMTP id
 00721157ae682-71bf0cddb9fmr32662157b3.6.1754653560280; Fri, 08 Aug 2025
 04:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
In-Reply-To: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Aug 2025 07:45:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7RqfOjP612_Miy-JTp-56oi24utAV7pBtpjvejqw0aqw@mail.gmail.com>
X-Gm-Features: Ac12FXxkFAZR0HWfVSFeG8aD6tgL6AjCIDf1XZqFSufHmaZxsq5D_8VEwNwvaAU
Message-ID: <CA+5PVA7RqfOjP612_Miy-JTp-56oi24utAV7pBtpjvejqw0aqw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware ath-20250807
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 5:43=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a7=
74:
>
>   Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 17:52:32 =
+0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250807

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/640

josh

>
> for you to fetch changes up to 35abebaa15c1ff1a141b7c24d79220ef70f48548:
>
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_=
V2.0_SILICONZ-1.115823.3 (2025-08-07 14:32:02 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (6):
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V=
2_SILICONZ_CE-2.52297.9
>       ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04650-QCAHSPSWPL_V1=
_V2_SILICONZ_IOE-2
>       ath11k: WCN6855 hw2.0: update board-2.bin
>       ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.5-01651-QCAHKSWPL_SILIC=
ONZ-1
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V=
1.0_V2.0_SILICONZ-1.115823.3
>
>  WHENCE                              |   8 ++++----
>  ath11k/QCA2066/hw2.1/amss.bin       | Bin 5349376 -> 5349376 bytes
>  ath11k/QCA2066/hw2.1/board-2.bin    | Bin 685144 -> 745408 bytes
>  ath11k/QCA6698AQ/hw2.1/amss.bin     | Bin 5140480 -> 5005312 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin    | Bin 6429240 -> 7056532 bytes
>  ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15392824 -> 15183928 bytes
>  ath12k/WCN7850/hw2.0/amss.bin       | Bin 6078528 -> 6082624 bytes
>  7 files changed, 4 insertions(+), 4 deletions(-)
