Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0361ECA1005
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 11:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B61CCC4CEFA; Tue,  2 Sep 2025 11:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0190C4CEF9;
	Tue,  2 Sep 2025 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756812638;
	bh=5E6jcqH0cTyrNUa1edZPPs2kKic+Y1u/MoAS6hEzav0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=llj/ALN5Z6Kq/TVs+kiYM3782MPIOem8mncA4JLcn2dbRDQMKsZvG5gsTkk4dM60+
	 oxbMc9Qiguj7xdwfmdOlJzX1Fo6xXhj0khKt6WfPIm+sOKTndoJbw3QVNRWUOzqALk
	 mSLE87HUm2MmF2mg/nfCPjGN2iPp2cNGLEGpTt4EE9y8TCFs2UHjv+emMFf3i6Cctz
	 LlT+Yk2wqzn1EChxmZHWyc11Q4caP5pvpRHFJti9nKrA/Y5md5N3eSMkWO05QGixix
	 zu/ZMvU0Grw7pXehg8p1CL4AdM/xsR73rKFVIKMjZd1pERI5PLU1Ciqk2uEWTvlvp1
	 b+HzrWCbJdUew==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-723ae0bb4e4so3584997b3.1;
        Tue, 02 Sep 2025 04:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOfh7hdL2OqeyN05vzlwnwT6zsJBgOaND5y6oKrdFbJJZemkg/ruec6VFtPjDw4zYEajcwgUuAZQ==@kernel.org
X-Gm-Message-State: AOJu0YzxxgnwD1OMSkZ7GhrWtWgyv+LGqAgqSeR3wzL5OhZz+lHLVdYb
	OV9l/+jVWxkHMsYtTicsXslCmRt9Alqkn2s6b04Dskcf4mJUoMzaGbJvdYjhN8X6S9XTA/cjqK8
	4CtSdYIAbddCXSQUDBiC8O3vXOmE6/zk=
X-Google-Smtp-Source: AGHT+IHOj1IlPVOeq0sTJ8l+WH8BLKEmsM12scHV8pjDOMwjtYkNH3fl2dxEoUy4zxRTvSOYPK2eKEFDO/npEGtOZf0=
X-Received: by 2002:a05:690c:8e07:b0:722:875f:5ba7 with SMTP id
 00721157ae682-722875f5c4amr88796167b3.39.1756812637858; Tue, 02 Sep 2025
 04:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <9eb91098-48a6-420f-bb6e-e7968ab0a2e4@oss.qualcomm.com>
In-Reply-To: <9eb91098-48a6-420f-bb6e-e7968ab0a2e4@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Sep 2025 07:30:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6FA8jSB5BLd-iQU7yAp+xszAKh=CQwSQRYJOHcP4ns1g@mail.gmail.com>
X-Gm-Features: Ac12FXyaoKSB3T-aSqJbcUgZ6a8FIusBLZoZHTbP1HQcv74E7cPjzJnDNfKMASg
Message-ID: <CA+5PVA6FA8jSB5BLd-iQU7yAp+xszAKh=CQwSQRYJOHcP4ns1g@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k firmware ath-20250827
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:36=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8=
b7:
>
>   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250827

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/665

josh

>
> for you to fetch changes up to 0cfc1632ef7b1cc15eea36214fc67098f6d49531:
>
>   ath11k: Support WCN6855 hw2.1 with NFA firmware variant (2025-08-27 07:=
43:22 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath11k: Support WCN6855 hw2.1 with NFA firmware variant
>
>  WHENCE | 2 ++
>  1 file changed, 2 insertions(+)
