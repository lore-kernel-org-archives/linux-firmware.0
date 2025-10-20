Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC90CCD199
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Oct 2025 12:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78FC9C116D0; Mon, 20 Oct 2025 12:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621ABC116B1
	for <linux-firmware@kernel.org>; Mon, 20 Oct 2025 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760962680;
	bh=WXjctkRuymC3su8syjX2mSM/L9Z3emQvZYDobXz6u6A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DEkNhojbVGLcpNoUCVK37MCw5OuzRicqxJBcyiM/cQGfJh/KBlOMWhi0vtDZpKlf+
	 B+sWhW9PmuVCOSNWWYVEJqK5SWo1juEkEMlNQ8ZrAi7xhBE3jgWMrS5QZVVN12BfvF
	 +MT/VkhFcYozrORJwLKOhs+YZGRoJn2ccW1gUCV0D1sRvAsiS+dUAivKYhHbnYjqyy
	 ta4sQeJnAxGxs6ocO0eZ+49/SRnnM2esPDIIsAxcgGEIHQR5uiPQ+euWR1MzfWdQ0C
	 rwh8q5nR7YmDznGb3XAhgKyWSuCcbMAsCZSkgJ1ffP+jX/WWbIQsXv4aPjdv8UbZtu
	 9psq8OkN48HJw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-783fa3aa122so27454157b3.0
        for <linux-firmware@kernel.org>; Mon, 20 Oct 2025 05:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8WxLN7DSR69MtTxLA2OOfo4p3I+OgHjqtHHh+3kFflB4b25xjQT4+DWTRV+8BmHPdT0IyLFcRmC5qCxhDIg==@kernel.org
X-Gm-Message-State: AOJu0YxCd2MJ08A0jYhoq4jdE2KxxlpheF3aJtUnka8q43FIB27LG/WH
	YcBII4LcdBYNKaHM/Ch2mmIdR2tSzd/CS6VjmTeA5IwT4dQqtRD6okc78/K+T4no/8FGQ0gESh8
	egNWIrL5SuU/N/mC26Mtnql3rRJ/fXdU=
X-Google-Smtp-Source: AGHT+IGiEyAkR3pfisriI9BRpTh6qaXFk1aupvDPutk6eujRPpRyIQiV1fwwnulsKO2xEhnNLmEGQZ0jdnvl7EIlms4=
X-Received: by 2002:a05:690e:12c9:b0:63e:29af:bd23 with SMTP id
 956f58d0204a3-63e29afc196mr5291172d50.4.1760962679376; Mon, 20 Oct 2025
 05:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <2416fe97-3288-47b1-478d-088e81176b32@oss.qualcomm.com> <tj35lu3t4jjo6gyc366awdqn53jjo7l5rrqtgac3qcpflfu5wc@4pedmvkwzloc>
In-Reply-To: <tj35lu3t4jjo6gyc366awdqn53jjo7l5rrqtgac3qcpflfu5wc@4pedmvkwzloc>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 20 Oct 2025 08:17:47 -0400
X-Gmail-Original-Message-ID: <CA+5PVA75jkuU12G21rwGMJ-cJHxAAfhweGkJhJARAe10wMeZVQ@mail.gmail.com>
X-Gm-Features: AS18NWBV9qrw29mG_A_6pEyKNaVXlaGRV6p1W4O2jk9goEG24PsjAIEp_AIAGUg
Message-ID: <CA+5PVA75jkuU12G21rwGMJ-cJHxAAfhweGkJhJARAe10wMeZVQ@mail.gmail.com>
Subject: Re: qcom: vpu: rename firmware binaries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, linux-firmware@kernel.org, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 7:10=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Oct 16, 2025 at 12:36:04PM +0530, Dikshita Agarwal wrote:
> > Hi,
> >
> > The following changes since commit bd4d2bde91e121c5bc85e6950a374a2e0ed8=
54ff:
> >
> >   Merge branch 'intel/dmc/xe2lpd/2.29' into 'main' (2025-10-14 19:25:50=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > video-fw-binary-rename
> >
> > for you to fetch changes up to 001b17a12956aeb46a9346862d05731c134634bc=
:
> >
> >   qcom: vpu: rename firmware binaries (2025-10-16 12:32:01 +0530)
> >
> > ----------------------------------------------------------------
> > Dikshita Agarwal (1):
> >       qcom: vpu: rename firmware binaries
>
> Thank you!
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/741

josh

>
>
>
> --
> With best wishes
> Dmitry
