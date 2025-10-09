Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB28CCD185
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Oct 2025 14:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33B67C4CEF8; Thu,  9 Oct 2025 14:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E01CC4CEFE
	for <linux-firmware@kernel.org>; Thu,  9 Oct 2025 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760019440;
	bh=8MFJx+8QYL6LGmxuu3VUlU6MKXr5Ld8KHmM2u1GMK74=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=D1PGo1V7rdQF0v3WsEnLMk5sgi8VFxhEawCZaDLQLdwhTmNx8xnjx2oEsBy0IIiXH
	 klGUEZDhHbZWzsrNn+zWL9FDFCJuwor7d0Vlk9Xpghx8dbrwooXP2eieBZOD9VhjNa
	 d22iM7mrnunkdW9TXBa6beD2rkuqpCra+Kd/JMekAlaIipGOMMLYl2xMfoQW764seN
	 QwEuur7VgHgfxJHjE0tlaI1jo+eof+EKyykfMjYIqWmD0ngFzyHAYlpBfoFdpGuAy1
	 Pj+Suicl+ULRJadyNZcXxWoUhVcYy3cPwW7jvab7ZYXXuBV2CVdwHZItjOdbfquNB+
	 lH62pffABEsIA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-72ce9790ab3so10279087b3.1
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 07:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXew/h6YyL+GaD0RtZfrs0cg4+qNLnUsu+XeVNbv20XHBwVMoRkmtl0oY+tfw+jTTGeW1anZrDHeaijk6g9Tg==@kernel.org
X-Gm-Message-State: AOJu0Yz+GBD8RaIkTnGg5Lk+mDrGCXfiVA2dHXag0bWWLcFW6fy1FSWM
	I0Q9+rd392Z+2w7NhKWJSnLvg82jdDRJ5EnYkDBAbtQIVrDOwRW1RZjty1T5yMq0xHERH/e3pp1
	EsqE0ygQAG1DZN6JdCScFvgKfuZNyhU8=
X-Google-Smtp-Source: AGHT+IETWSg3sJGg9WyXROMj1gJK6gYuB5ftqsqRQO2V6BE47WbByf5lZn/knIDBtX7lw/jJG6Unb+3VqqhFhJ//AYI=
X-Received: by 2002:a53:bc05:0:b0:636:1f9f:698a with SMTP id
 956f58d0204a3-63ccb84f463mr5549276d50.21.1760019439305; Thu, 09 Oct 2025
 07:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <66c935e2-58f7-4c6e-ad4d-77351dcf2a58@oss.qualcomm.com> <ifd327mmlltfknamyysuuthkbxtrshgwmhnotgwslmmz6s4q47@vtd5b43opllt>
In-Reply-To: <ifd327mmlltfknamyysuuthkbxtrshgwmhnotgwslmmz6s4q47@vtd5b43opllt>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 9 Oct 2025 10:17:08 -0400
X-Gmail-Original-Message-ID: <CA+5PVA78dDdQ1WNrTKVx6HLC-AH-cbCybMAsoRuAfTuwM4Uq=Q@mail.gmail.com>
X-Gm-Features: AS18NWCeESqHopoyxzoJkXPmrHukyIZ8QcRkqLU5QBNdpDDWf8vk6oB3S-WkySI
Message-ID: <CA+5PVA78dDdQ1WNrTKVx6HLC-AH-cbCybMAsoRuAfTuwM4Uq=Q@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 8:29=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Oct 09, 2025 at 06:19:25PM +0800, Xin Liu wrote:
> > The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f5=
9034:
> >
> >   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21
> > +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > cdsp-109-knp
> >
> > for you to fetch changes up to 235a4d1018bef7fb0d849a36749c910d7c95391e=
:
> >
> >   qcom: add CDSP firmware for kaanapali platform (2025-10-09 18:05:39 +=
0800)
> >
> > ----------------------------------------------------------------
> > Xin Liu (1):
> >       qcom: add CDSP firmware for kaanapali platform
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Please be sure to send DSP binaries to hexagon-dsp-binaries too.

Fails CI.

Check whence.............................................................Fa=
iled
- hook id: check-whence
- exit code: 1
E: qcom/kaanapali/cdsp_dtb.mbn not listed in WHENCE

Please fix.

josh

>
> >
> >  WHENCE                      |   3 +++
> >  qcom/kaanapali/cdsp.mbn     | Bin 0 -> 4956632 bytes
> >  qcom/kaanapali/cdsp_dtb.mbn | Bin 0 -> 40760 bytes
> >  qcom/kaanapali/cdspr.jsn    |  29 +++++++++++++++++++++++++++++
> >  4 files changed, 32 insertions(+)
> >  create mode 100644 qcom/kaanapali/cdsp.mbn
> >  create mode 100644 qcom/kaanapali/cdsp_dtb.mbn
> >  create mode 100644 qcom/kaanapali/cdspr.jsn
> >
>
> --
> With best wishes
> Dmitry
