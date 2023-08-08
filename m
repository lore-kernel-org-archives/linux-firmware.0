Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627D9C001DF
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Aug 2023 10:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E620C433CA; Tue,  8 Aug 2023 10:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CC8C433C9
	for <linux-firmware@kernel.org>; Tue,  8 Aug 2023 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691492238;
	bh=vvHBqPfKoQDws7UtFESEFx9Xq+pr7qBB8f0Aip3wxV0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XJPKutY0MuPVtUDIYtz1SspWdhKB5olcAbkZRkJlDBhLWob6q4KLKjcpvIZaSDiqV
	 rI83VTs4euV0OBUsqWT9fjemcEB89J797gFqI8uFzHlVtlE2p3zQEKM/RL6WICW2IX
	 QeCcFOx6LJY3ishP7aePoHaFeibHvqmVEjKndcNuax37WXgdix+rwOgMo0dmkuhIg+
	 LYnE9u9+DmwRxv6uG3OlvR6QYU0llDTcBwazMDpmIMtP/q1ohSLqU/Y1hBN0MLIwph
	 zjqaSrDf2b8mYAwH7SwXvR0S3qPK5GoEQ8NLyLOiB0xoofHd6Q9XDjcaaOyIoKnuJs
	 htt/+9Ro6Q/zw==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d4364cf8be3so4451293276.1
        for <linux-firmware@kernel.org>; Tue, 08 Aug 2023 03:57:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQNF1utTNQDnxbTq7aqq3Ja5bRGRQspT6CPJjveKIm8ZMXXLg8
	/kyZRnKQdqVnw+JZ3yfXDoQ9yGuNOLHcN5fDtd0=
X-Google-Smtp-Source: AGHT+IHEnrMW7j34kcbUrOA/z5Iy9GcWU4MC1SPE1tazWZ+g4RIrD5CpQjEIWpKXW0PO1p9KfXfLS0oYRMWrv3CE6P8=
X-Received: by 2002:a05:6902:248:b0:d3b:3f67:960d with SMTP id
 k8-20020a056902024800b00d3b3f67960dmr10663843ybs.41.1691492237123; Tue, 08
 Aug 2023 03:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <ZNEIMX97ze8lEz9Y@chelsio.com>
In-Reply-To: <ZNEIMX97ze8lEz9Y@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Aug 2023 06:57:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4pUxt9hAsytDE_7Qff=QTKVSir9CdKToDuRnsjknuNMw@mail.gmail.com>
Message-ID: <CA+5PVA4pUxt9hAsytDE_7Qff=QTKVSir9CdKToDuRnsjknuNMw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.27.4.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	ramaraju@chelsio.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 11:05=E2=80=AFAM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
>
> The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8dd=
b5:
>
>   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2=
023-08-04 06:33:54 -0400)
>
> are available in the Git repository at:
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 06fa7dd2046343ecac54b75b9541cffd6dcc64ae:
>
>   cxgb4: Update firmware to revision 1.27.4.0 (2023-08-07 12:32:53 +0000)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.27.4.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.27.3.0.bin =3D> t4fw-1.27.4.0.bin} | Bin 570880 -> 570880 =
bytes
>  cxgb4/{t5fw-1.27.3.0.bin =3D> t5fw-1.27.4.0.bin} | Bin 678912 -> 678912 =
bytes
>  cxgb4/{t6fw-1.27.3.0.bin =3D> t6fw-1.27.4.0.bin} | Bin 730624 -> 730624 =
bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.27.3.0.bin =3D> t4fw-1.27.4.0.bin} (99%)
>  rename cxgb4/{t5fw-1.27.3.0.bin =3D> t5fw-1.27.4.0.bin} (60%)
>  rename cxgb4/{t6fw-1.27.3.0.bin =3D> t6fw-1.27.4.0.bin} (76%)
