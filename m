Return-Path: <SRS0=Fwl7=BE=lontium.corp-partner.google.com=xmzhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37498EB7EA0
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Mar 2026 08:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01BCBC19423; Wed,  4 Mar 2026 08:10:29 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B17A5C19425
	for <linux-firmware@kernel.org>; Wed,  4 Mar 2026 08:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B17A5C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=lontium.corp-partner.google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lontium.corp-partner.google.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d4c7d04890so5924794a34.3
        for <linux-firmware@kernel.org>; Wed, 04 Mar 2026 00:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772611824; cv=none;
        d=google.com; s=arc-20240605;
        b=cqYCfs/qoLLf8Qkcosvf9HZ0BNe0/x0nOQO02KkPmgSYcjfsU+e4cjKTISri/CyPzK
         Vi5derRStjjPtj97wR8ENiS8aqNH0gbAGtHAu1HOES18eiivXDjwXbeMa0YAVV5Bh/4q
         09/QXGu3K4Jfr4A4pZUd5aZ5WDxpFiUaqUddH+Mzws76VSKaEcszARS5GDFLHNgARTNS
         p1Dcxcw4Nob7d+oog6dJdqXRQwqTaffFlsdJeHvZNf8a/XbV0yj9o2yIZjASNY7KGiFW
         IkYTyiVvDMheOuqhpMi88zu3DoekYV8LKR0QffcB5iy5Z+HQ568+OgN2GyfwqYUv/5bO
         F0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ln0eEFrHt291sw5PJzCALy0wjo1DfErxx6SwF3L8J/Q=;
        fh=HrzdJ3opHsjKLMflRK6vzoT88MYcw+/+7W+G9yM65TY=;
        b=AcoVDJAyQAXwoek4zalwhh+lRhAsxa5zm8TyaCCGoeXgJemTcRy3TaQ8IDFlIR/y0h
         OiPNAdx+X+zl8tYzz5jQOffmKVh5+NiSGPjy13WBOCgazzJ7VbcRtlIExku3rVdeog7u
         qAUgc1wyk3JqIsGjRjB+FFGqxDI+491R5hRQOlye5iU1tzl7ekwyws+bD8UB6Yg93DrN
         4ISxt7Z5KxN2aLBwLfyn/x/1nqM6ckoxyJ5wSU+uDTP9FTK3ZkaHTKkedh7CW9vY2Dpj
         JoqcfSEEYouUhBOhEHBHdGL8XaZFNpiqR3SGcLkIbFvsvjO0kquJXFHzxWaG6F9OaReY
         RGhw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772611824; x=1773216624; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln0eEFrHt291sw5PJzCALy0wjo1DfErxx6SwF3L8J/Q=;
        b=xvVHIwthywGS6CjhJXXygOx3hDMfPiijpuDtyXPfSLrnqcy+oB1sHwUJWNmO7ng9o+
         iYdExw1V7BTu0t6dcRrm7E5JOQDzRd7dZqtNEv8SHjNHqjpDOZmaIHMm5qM9+eS4vgAq
         t6tFtz5E27CSKMhsG9CsI1rS0U4Yrk+An3jCKxbH1gSV15l8zkR2IFIuBQPG06rekm9V
         TR8PntcpL7Xossm1nvT5F16iFqxc5qqkjO3x3IwQovpfPSdeVkxvNy0sTfGS9KRJjSZl
         yngzvUP2katLD9wo5ME5lUxBpXFBlN0MV1jrCe53YMwMiR8qUR+4MredwYJpRShA5WX7
         AN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611824; x=1773216624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ln0eEFrHt291sw5PJzCALy0wjo1DfErxx6SwF3L8J/Q=;
        b=ndxnfrp23JUTG9jMEwE31xniH3ivyDSelQbJfWovanerFY/v35Do7q82eW9j3WLubB
         ELseYl+umYNEcvVoNjU3pzDx7P6IYDA1akiA0Ff0nQA4Cd8RfdhwaPNAX3Hht2bA8ZgV
         OjVckZVUy9sKpSF7yp9XzqiDH/bqXOV4KC7sPAsnE+HFsfD4L0YQQD6DqxhE7ILmicGq
         2MN14RVUXyPKBPD0nne2ejWoFSlV/jqAXsbC/j80gxIfjJO1ORGjhMSleWwXKbwfyI25
         GmelKaaLFoCCAxxWGYOfIrQ3B7tkUAZPjKG8XH/kwLzbmCvm8c1VW6xjlUt0Q9nf7xFc
         5kZg==
X-Forwarded-Encrypted: i=1; AJvYcCXi5JRr13u9FUBJNzqkqQ6vwl6RVfH4/n9E6pCOsW20tGJ6fJK0Y3/b8UmJzF6MiQH10lpvlz0+9Dyf4otwGw==@kernel.org
X-Gm-Message-State: AOJu0Yzpa2L9pzUttz1gdyoPkW5o44XD3769aPzg+sQQvSmit5/Q7t2E
	HORky2UNTjsQpW+HFiXn3Xq/BUrzjvezLfR6uSMBLo/Mmznj2FiD1dGCcC9Doeh3h38EwcPobWY
	nFY6ivcnNGhfiVlF+EE8CfB5Qm9UFdxXgte8QXdBJ6mO7KPvWJwOfjbe5
X-Gm-Gg: ATEYQzxQADVY/KqIf2w6R0k//gw9JOBoVN4OIKaBgdUUZ7WnGz0Z8IjYORKJW/Q0r3i
	KJ9uCiMREim05fPmSQ/rE0TnpmwlAsMOMuRMB6CZeEsS25I8c7EeL8qoWOSaD0WOU8swnvkmCJ+
	iC6JbMtuvDxD5ZZoxcfX9JCnffEwGjlgQ/KPCA9l5MdkQVJSmVJDuegwMWjbECE8xOVacnBiDip
	HryyUF9jrwcGEZuqNWkkVbm1KLn/b6YYIjB1KXK4Hgg3Yp3EaIX7KoqlxZ41n28r3FUe2YJNdHg
	DhigSg==
X-Received: by 2002:a05:6820:199b:b0:678:7fa2:aa6 with SMTP id
 006d021491bc7-67b17767985mr863274eaf.57.1772611824519; Wed, 04 Mar 2026
 00:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
 <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
 <CAC7NNnoYY1=NbdomzEH=ajiBO7XikeNmR3D3LCSVZsAPxEkr_Q@mail.gmail.com> <libgdoisf2pawl4ggnxxrr7sks3bcael6f5ix2ytrhvqsqauw5@vl23g3wi4xj3>
In-Reply-To: <libgdoisf2pawl4ggnxxrr7sks3bcael6f5ix2ytrhvqsqauw5@vl23g3wi4xj3>
From: Simon Zhu <xmzhu@lontium.corp-partner.google.com>
Date: Wed, 4 Mar 2026 16:10:12 +0800
X-Gm-Features: AaiRm51sq51ZHNs_FUKWw7k4Afvx4-c6MdY_GjtnNHNAGR3MXwCzoxXzYLNtXhE
Message-ID: <CAC7NNnqZXo4vwE8TtVjgV6pJ88hYAafJnccBdJaGf+Xpa=u9YA@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: add firmware for Lontium LT8713SX DP hub
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>, linux-firmware@kernel.org, 
	Tony <syyang@lontium.com>, prahlad.valluru@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:38=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Feb 25, 2026 at 09:12:59AM +0800, Simon Zhu wrote:
> > On Wed, Feb 25, 2026 at 2:33=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Tue, Feb 24, 2026 at 11:42:49PM +0530, Vishnu Saini wrote:
> > > > Add firmware V667 provided by Lontium themselves.
> > > >
> > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > Cc: =E6=9C=B1=E6=99=93=E6=98=8E <xmzhu@lontium.corp-partner.google.=
com>
> > > > ---
> > > > This patch adds LT8713SX firmware provided by Lontium.
> > > > ---
> > > > Changes in v2:
> > > > - Added Lontium in Cc to confirm License and binary version
> > >
> > > It doesn't confirm anything. An email from Lontium will confirm it.
> > >
> >
> > This firmware was provided by Lontium for our partners to use.
>
> And Lontium is fine with this firmware being a part of the
> linux-firmware (and thus most of Linux distributions) under the terms
> specified in the file [1]
>
> [1] https://gitlab.com/kernel-firmware/linux-firmware/-/raw/main/LICENSE.=
Lontium?ref_type=3Dheads
>

Lontium has acknowledged the above content.

> >
> > > > - Link to v1: https://lore.kernel.org/r/20260217-lt8713sx_firmware-=
v1-1-f78b85fceb63@oss.qualcomm.com
> > > > ---
> > > >  WHENCE          |   8 ++++++++
> > > >  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
> > > >  2 files changed, 8 insertions(+)
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
