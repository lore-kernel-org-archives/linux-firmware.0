Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D77C3DA6D
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 12:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60A2EC4CEF2; Tue, 20 May 2025 12:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF52C4AF0B
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747744999;
	bh=Lp5ste04kllllsUUvMRELX66f+6cU0cGFGjtsCDYA/o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BOHcQzEq1bfV3RATRSq6AmyGwFAl1zie5w5XUtPHpPbx+erIQ8WbpHSeZOIkbKfgB
	 zRjMs/A6HamqnOo2Td/Q5/QE1rceC2ZkN5ARSGbf+TTCq/VaLNuaTi2w6UyGAN360O
	 TCxkOxvSGHFT3dYALmHDOZCqcQFthRv/ilzw/kcl1200donYCbSHPXGvS0KGwkw9zC
	 LucmNP0ZpvdUWKZiqDCuOqnsrdYCxe3L2ONtyhL97dTy4Ma7dQjLsZBBmBJ/TQp8dG
	 /hiUsiISkEVd+Qg8+ztSoi2zsZH0lityQJ26tx8AjoDcK5Ar4CCkaJHD7UUtavQdcw
	 x36zuUiMq6MrA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70811611315so50726387b3.1
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 05:43:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1fwpi7H8CccZ9sJrQrMqKm/7m8Zcu7rj/bpX+6Qnk0p467QWtMc9sK/B5B1r8BXj/QQQZh9KtLSlm2SHONw==@kernel.org
X-Gm-Message-State: AOJu0Yxt6pT16ZmRwWKA9kF4YD2qWeuLbqtytJglwgU8JPX5IzRzPVsY
	0NdloXiNyzwajSn+l2gqPa+EdGthn/c1sxOu8iht1JfSGJeciuyhChwJChXtS4EKWYRg+xi1VB+
	1yc9estOccTOqxn0v3AXn0GB5ANXzh9o=
X-Google-Smtp-Source: AGHT+IHSL3zsi9NePEtqEFidxG3hk56yqbOCRhvrRnPZ1TEY2/pquMd8LOCEq7ZZXWZdZX7LRN++pk85K9yIi4ivAtk=
X-Received: by 2002:a05:690c:368c:b0:708:bb8e:38b5 with SMTP id
 00721157ae682-70caaf3c510mr202833037b3.8.1747744998479; Tue, 20 May 2025
 05:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <7b30419d-e801-44a3-86a4-b18da83ad066@oss.qualcomm.com> <netxlhikdd2jlievf7mevbbfpffaz4ttkjw6eykwvpklccoxbw@qtzh5hiqwcpv>
In-Reply-To: <netxlhikdd2jlievf7mevbbfpffaz4ttkjw6eykwvpklccoxbw@qtzh5hiqwcpv>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 20 May 2025 08:43:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5ndCY3gzjmUAD3_=yb4Xa_NUoAFxddvWJLgvZoy7cObQ@mail.gmail.com>
X-Gm-Features: AX0GCFsSNYIPHd_6KHb1bht_vH9aRdqryb48ES0-JS4rx_smVe49FAwAJy7qDn8
Message-ID: <CA+5PVA5ndCY3gzjmUAD3_=yb4Xa_NUoAFxddvWJLgvZoy7cObQ@mail.gmail.com>
Subject: Re: qcom: add QUPv3 firmware for QCM6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, linux-firmware@kernel.org, 
	mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 6:48=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, May 20, 2025 at 12:51:47PM +0530, Viken Dadhaniya wrote:
> > The following changes since commit 759c4acafb4a80d76885e4a1542229a27d67=
7322:
> >
> >   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:07
> > +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > qupv3-fw-qcm6490
> >
> > for you to fetch changes up to be949ef4113e8dfabafae6313f6bbe88520f483e=
:
> >
> >   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-20 12:07:53 +0=
530)
> >
> > ----------------------------------------------------------------
> > Viken Dadhaniya (1):
> >       qcom: add QUPv3 firmware for QCM6490 platform
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Mario merged the original PR already.  Is the only update the change
of the driver name in the WHENCE file?  If so, I'll just change that
in a separate commit.

josh
