Return-Path: <SRS0=ZqBG=SI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978E2D637A4
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 17:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62471C4CECF; Wed, 13 Nov 2024 17:53:51 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EFE4C4CED2
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 17:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EFE4C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e2974743675so6745950276.1
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731520428; x=1732125228; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0HM892jiNpcUVDvngIW3uKBaNyn81wMonH3CRQInwM=;
        b=QOyISMTKVf06BXj3RXeoWiRWQf+Zf6x+qvFkiSGDznmHzGtJ0SOEH2RpGzysQmM4ml
         R33dSKaLNxwC+Ck2leYL7qeVn8SFtws0C37/o3wt52HmkK9xRJgMvbt9izhAO+pyZ4i+
         ESPXXFlYfzshjOycWzTC1JBmcY/o7/oP/LH6Z23ovYW20cKn56IYWPG0lzrS+juufI/u
         My8NRLVNd9R9HCnF5QZtM3ewztq3FVzLw9rB7SZDB562y4RgjnvhzyZZLg1nK3J411Od
         Zb//ntbKdTodLAMnE4rzgqyP+L66LXPZudepGka2TRDwa4j/VnnV50+Q5Fs89p6/LFSz
         +6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520428; x=1732125228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0HM892jiNpcUVDvngIW3uKBaNyn81wMonH3CRQInwM=;
        b=QZH4WViqC1gplYrR70RSs6L0D7WSTxUUQjEtJfhJ6XkX8Eo1mQu28NGDSZpWds6kJc
         5LIHgchZYUWgu3wXhIea2OAiT0z08wYbO39QwrnMVYCqD3imLawipCPr4buSx40Ja1Vg
         P80L2WG8Eem8qJrOCNO/LJBosqOTvwh/dcJ17o7LMV1OLQs6kwIP8FDAAj9qPTUV6wFH
         XM3udab6jFn0USbPvZTAdBXQE9IQhh2eUsqx7W3DUQqUuWKm6OHw1Lb9bdaB/W8u+OKE
         MQVP6vRNu4s0JJvycTJ93H2Ay30DvpEEzOulIhGvsin6ScWXpZce+jWqduVi0xEvZiEl
         p6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoA6aNGHUWe024FxgynaBfPZjnqwBrVzuhXhUX4ylfkMjXZsjdX70YL8uShoS/zirEdBQrv9Dsx9SXMkfZqw==@kernel.org
X-Gm-Message-State: AOJu0Yz1SjXdCCeYPAriVdbttv3s8KWhSOkwFctKDHsL3YGIEYCqDj4z
	RhbFHc6aK/ZtHCK6Gc7LPs3kQ0q3K5IPoAvrRcji0SwMZxo0DWjOmCtkpwj+Q8jNw5LCuGjKzL4
	R1v8yX+M4SA4Uw1QEJ0me4tDRI9SpYJ7MYKFzYw==
X-Google-Smtp-Source: AGHT+IG/FxsxAVZjA0S4w2yNDF7845ou6UQCRi8CzwPkPHrpGvfQjJZBg9L9DaEJfeAb1k1rHj0ZKAv66tVhrBp5EBw=
X-Received: by 2002:a05:6902:2b01:b0:e35:e0c4:a06b with SMTP id
 3f1490d57ef6-e35ecf0b3demr4644521276.25.1731520427281; Wed, 13 Nov 2024
 09:53:47 -0800 (PST)
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com> <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
 <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg> <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
In-Reply-To: <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 19:53:37 +0200
Message-ID: <CAA8EJppUfGB4XcZXyG=ZUdKREo+x6yR=dAbahdjMvzShCmqoDQ@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Nov 2024 at 17:00, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Nov 13, 2024 at 9:43=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Nov 13, 2024 at 07:22:28AM -0500, Josh Boyer wrote:
> > > On Wed, Nov 13, 2024 at 5:50=E2=80=AFAM Renjiang Han (QUIC)
> > > <quic_renjiang@quicinc.com> wrote:
> > > >
> > > > Hello
> > > >
> > > >
> > > >
> > > > The following changes since commit 6482750d396980a31f76edd5a84b03a9=
6bbdf3fe:
> > > >
> > > >
> > > >
> > > >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > > >
> > > >
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >
> > > >
> > > >   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-=
firmware-qcs615
> > >
> > > Merged and pushed out.
> > >
> > > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/37=
0
> >
> > Josh, it is very nice to see a promt merging of the firmware, thanks a
> > lot. However is there a chance that you can give reviewers a time to
> > react? Usually there are no issues, but I think it is important to let
> > the comminity to be able to review the patch / pull request.
>
> Happy to let things sit for a while.  Out of curiosity, what exactly
> are you reviewing?  They're binary blobs.

Yes. However sometimes they can be pushed to a disputable location or
have other issues. In this case I'd like to understand whether this
binary is specific to QCS615 (and thus it should be a separate binary)
or it's just a somehow updated version of the existing binary.

--=20
With best wishes
Dmitry
