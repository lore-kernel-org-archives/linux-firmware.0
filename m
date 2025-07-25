Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6849CC87FCE
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Jul 2025 12:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E2F7C4CEEB; Fri, 25 Jul 2025 12:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38282C4CEE7
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753447620;
	bh=qMY3RU1pgmls0J+B1IbawrNawgRfHbkNSfpsqKM4iWU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LMK40Bk/obRiIbdp4kDPtGoG8knZVfw2PZu0ZYaYh1+aOFVloqgTzHGwiSOdn5X58
	 sgpK/VPfEAtgPxE+EC9B1i6zUeUROgeZSgVqydp43XFw3Yv03B9pdvS6g1BLU5luu5
	 B6iyM39kmOMxAurtXeGxbZAQtABPJR+MfCQZSSs7GQpMUbOx61mNZxmfys2TLQrLVf
	 yBFT5QMXn4SRUCIWWkn4d4Emc+uqIQr68zSn9LyBPfhYVizUQA/HqjAI9y4mEqsfe8
	 9tCv5W5ktQyXYnnhqd1mnXGsmdJDQ5qJfNqDJdyKLEtvASLf27f/+36XeuwRdwrFzA
	 U4tOyfrVOwx1g==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e740a09eae0so1966215276.1
        for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 05:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHOvq6Q+z3LzwsjVpGDOdjSQMFkGXigxutHOekCmZA4ldvRnJyphLuCtVDqUSGXJnfUg/NT3dKxfA9iPK6hA==@kernel.org
X-Gm-Message-State: AOJu0Yxcz+19J87zbYv1TckikcKds0nJzKGhblFKhpNH6LP4mnwitSJu
	VY3YGsP+xwHLtj2dl0swf/zZywt2fx28Vj39FCp4I5YAfzPIHdYMmt9SUgwZ8lze+NC6Mdfv8Oz
	qV8QjZ6EZ32UlwxoW4UUXFJbTHgeLpL4=
X-Google-Smtp-Source: AGHT+IHagwIJ79JivHiKcGTG6WMn3YZ4bP+4+8ClYnfFB6ST0tcrZfO1B3FkLQn2+nWmFCyq1icpRY/3DK5nlwRSuS8=
X-Received: by 2002:a05:6902:4201:b0:e8d:b885:7b9d with SMTP id
 3f1490d57ef6-e8df1235c56mr1496864276.29.1753447619235; Fri, 25 Jul 2025
 05:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <495fc2f1-726d-45dc-ee84-ccd1e88f467c@oss.qualcomm.com> <csl6h6a4xt2tut72ochnscixkmx3pg275t5zfeougvasj3odi7@winomhljjsdh>
In-Reply-To: <csl6h6a4xt2tut72ochnscixkmx3pg275t5zfeougvasj3odi7@winomhljjsdh>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 25 Jul 2025 08:45:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5E=KbYqFnJbia4ax=-80DoPexsCjQi2TDARNkpquQ0xw@mail.gmail.com>
X-Gm-Features: Ac12FXy3FASvatJgBT7VF1SzoDqNCXUF6c73tnTTMJyCdyzlMjExMoVkLEQtnLw
Message-ID: <CA+5PVA5E=KbYqFnJbia4ax=-80DoPexsCjQi2TDARNkpquQ0xw@mail.gmail.com>
Subject: Re: qcom: Add QCS6490 symlink for QUPv3 firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, linux-firmware@kernel.org, 
	mukesh.savaliya@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 7:06=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jul 25, 2025 at 11:28:31AM +0530, Viken Dadhaniya wrote:
> > The following changes since commit d89120bb80fc9d4ae7c7485033306acc12e3=
06e5:
> >
> >   Merge branch 'cs35l41-20250721' into 'main' (2025-07-21 18:56:30 +000=
0)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > qupv3-fw-qcs6490
> >
> > for you to fetch changes up to 8cc24d2326065a093bbe080a0b3b197ad8ac1905=
:
> >
> >   qcom: Add QCS6490 symlink for QUPv3 firmware (2025-07-23 15:36:14 +05=
30)
> >
> > ----------------------------------------------------------------
> > Viken Dadhaniya (1):
> >       qcom: Add QCS6490 symlink for QUPv3 firmware
> >
> >  WHENCE | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/627

josh
