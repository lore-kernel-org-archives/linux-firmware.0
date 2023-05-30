Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E8C77B73
	for <linux-firmware@archiver.kernel.org>; Tue, 30 May 2023 11:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0361EC4339C; Tue, 30 May 2023 11:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1349C433EF
	for <linux-firmware@kernel.org>; Tue, 30 May 2023 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685447239;
	bh=IVQCYgWHAdFO66G8Rc5qgTtTBcp4DDGRFGTkOoyy8qI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oXbNKrImYdxe7hRChY5p9hhvJiUKq7N6s9cJG7eRaMxi1Xsh7X1wZf+3k+FmdqoF2
	 vPRlzoG8Oy/LTYpGpcmaQwM/kn5iduIIU3puvnCdW9u6D8OvA+0sTe5LjjuFj0xFhL
	 0AyIIf9RnuwPMukIHg0HvJByubs2tK8Ao7lWkVcsHEIdNONf7cnAfb/Cj+vNF57r4L
	 CFe5Nz7hsqlmmVJ9aOajfoM6oPi8h/RbNU6cHDwbpKbRoc+hKhLvMMw8jHrK8LArly
	 qTqHeFl2a4grF8zrAQ+LnSJW2glKjjVMod8TImeWnmCTpByqJDt0OBqm4SuNo5l1Sf
	 O5aXyzBuIbetQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565f1145dc8so28804237b3.1
        for <linux-firmware@kernel.org>; Tue, 30 May 2023 04:47:19 -0700 (PDT)
X-Gm-Message-State: AC+VfDy2CqE8NovOz5gzZRR45RCHHz3x9DYzI3nFBKxKctthv6Ip+cVW
	sC6ryQIsqE2MOoByoAWF6qy8wCg9VwShyEMt+QU=
X-Google-Smtp-Source: ACHHUZ4ZZIIgPiV21+VmsictA7pHzHzxVv37V/13/3TufNiXXzLEDft1Aqjb5ggtG9Ts6tUTJF17Oqkq8U2jtuuZhh8=
X-Received: by 2002:a0d:dbc6:0:b0:55a:9b89:4eff with SMTP id
 d189-20020a0ddbc6000000b0055a9b894effmr2060763ywe.13.1685447238927; Tue, 30
 May 2023 04:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <ZF4L1/RVZXJKhTx0@chelsio.com>
In-Reply-To: <ZF4L1/RVZXJKhTx0@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 30 May 2023 07:47:08 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7kKEbqXVVJ_z_0djwWKsBed8Mvt=f8fs7K+aUNb-+GFg@mail.gmail.com>
Message-ID: <CA+5PVA7kKEbqXVVJ_z_0djwWKsBed8Mvt=f8fs7K+aUNb-+GFg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.27.3.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 5:50=E2=80=AFAM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
>  http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
>
> The following changes since commit 6c9e0ed5362ff9fd74c11a2b9552a9223371f0=
4a:
>
>   check_whence: error on directory listed as File (2023-05-08 08:38:18 -0=
400)
>
> are available in the Git repository at:
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to a0146258f1b44913f763eec95168ceb1baa5f4a3:
>
>   cxgb4: Update firmware to revision 1.27.3.0 (2023-05-12 08:55:06 +0000)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.27.3.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.27.1.0.bin =3D> t4fw-1.27.3.0.bin} | Bin 570880 -> 570880 =
bytes
>  cxgb4/{t5fw-1.27.1.0.bin =3D> t5fw-1.27.3.0.bin} | Bin 678400 -> 678912 =
bytes
>  cxgb4/{t6fw-1.27.1.0.bin =3D> t6fw-1.27.3.0.bin} | Bin 730112 -> 730624 =
bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.27.1.0.bin =3D> t4fw-1.27.3.0.bin} (59%)
>  rename cxgb4/{t5fw-1.27.1.0.bin =3D> t5fw-1.27.3.0.bin} (50%)
>  rename cxgb4/{t6fw-1.27.1.0.bin =3D> t6fw-1.27.3.0.bin} (59%)
