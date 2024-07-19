Return-Path: <SRS0=vfJW=OT=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60217C3DA59
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jul 2024 10:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19E23C4AF0C; Fri, 19 Jul 2024 10:03:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA0D1C32782
	for <linux-firmware@kernel.org>; Fri, 19 Jul 2024 10:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA0D1C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso1678934e87.2
        for <linux-firmware@kernel.org>; Fri, 19 Jul 2024 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383377; x=1721988177; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHNnLfch6WFVSzQPrKZyiqluVxXPZBjNyBbIvUOnhGE=;
        b=R6T/bC8pjgq3J32vInmqo6D+Mmha0yt/gzg1TzgioA4ZEQhM8L5WdvbUNzRF85piRm
         E7DGPIwpDpYvEjJgpigHC9/hSW1BHfquKkkxvAesRm7ZP7qXU7EO2S53kBscnbBRP+X+
         lnzTXG0K+otCzDmfsdMgQAUhCwrcW4T6ZCk6SiPl/c6PLlXEfF9gK60wtjyDgoLlmN3c
         MDPakMeVrZvb2cV08jXTLKkVGNFOsgPJz/7AwCWYUUl1eD4TYqgoZ/gkg+V7c65XGEk9
         NbqvBAsm9PXBx/Wzwee31GBfdmQPF/aEqjdOi6wW0RS0O4vlBsVWaH/IhbLxant1kI/K
         QPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383377; x=1721988177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHNnLfch6WFVSzQPrKZyiqluVxXPZBjNyBbIvUOnhGE=;
        b=lkwYXMnNATUQHG1/vbI1uYILP1oXLDN1R98bc+m/zzku8nKQOhHgwTvN2P9tOOQYv2
         PUEiFZ96M5/p4WIEE8vS3ng0xEETDYfbxKj74XO3ZdrdyW2qL4Obt7Tee6GIlG1P1vC5
         TeIyG6HBwg0lAoEyWv0IJMs5D+qM17fZ1XWZUfYA9oWMhkLKWj9Jm6JNfQn8mgTy3TaB
         83hW5MZc8QtHz4XiSUixnxDGaO+pb4EYOToTJcz1/pb9ByTrAu4GlczTsDFoxZHm4VH9
         u3c8jbi4OeeaYk2GGKfrEH3HeL947h46wissgGvOqgPuVHARqycbrXb+lQvZbNej2E9J
         7Olg==
X-Forwarded-Encrypted: i=1; AJvYcCVEUK1zE6VQdl4Bx+JpNJg+UjSqQQcTnlmg6/Wi5uWPGj9u3PW1qPZz/Yz7gpBnb5mp5oOJoED5YNKgKh1e9ilE1SGPOSnFMd22
X-Gm-Message-State: AOJu0Yxlck5kE+5YuZxfXRnUffY9R8dgDDdOpqrjgA2uUMG4XalLPMXA
	9uYS3MSPFF0oETu8INvI95nXBDl+tnxXeID4PipCW3V7lU0yQpmAm2kC+9Uprh4=
X-Google-Smtp-Source: AGHT+IED6y1tnJ5XrT0b+mNFEwXHll5lZGlxvfoO3lJ7rMH1zs8DNLtBXo4wW882uhFeYY0NdJ8Ekg==
X-Received: by 2002:a05:6512:2387:b0:52d:259d:bd91 with SMTP id 2adb3069b0e04-52ee53b04c7mr6067497e87.18.1721383376987;
        Fri, 19 Jul 2024 03:02:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5577b46sm146169e87.259.2024.07.19.03.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:02:56 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:02:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-firmware@kernel.org
Subject: Re: [PATCH] qcom: update path for video firmware for vpu-3.0
Message-ID: <v53erplurzmez6rh7pnf2qyc33jxrg4soxuo2xspsjx3zimrcn@tybzz37og454>
References: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
 <CAA8EJpo4OijebJ9n3TONnB+huT3+VkZEE9LCHETV8iWAYZXsdQ@mail.gmail.com>
 <b99c3806-b3f0-d73c-2338-2e98de52132c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b99c3806-b3f0-d73c-2338-2e98de52132c@quicinc.com>

On Fri, Jul 19, 2024 at 12:16:10PM GMT, Vikash Garodia wrote:
> 
> 
> On 7/18/2024 5:07 PM, Dmitry Baryshkov wrote:
> > On Thu, 18 Jul 2024 at 14:10, Dikshita Agarwal
> > <quic_dikshita@quicinc.com> wrote:
> >>
> >> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
> >>   new firmware files.
> >> - Create symlinks for firmware files for vpu-1.0 and vpu-2.0 in
> >>   the same sub-folder.
> >>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  WHENCE                    |   2 +-
> >>  qcom/vpu-3.0/vpu30_4v.mbn | Bin 2306664 -> 0 bytes
> >>  qcom/vpu/vpu10_4v.mbn     |   1 +
> >>  qcom/vpu/vpu20_4v.mbn     |   1 +
> >>  qcom/vpu/vpu30_4v.mbn     | Bin 0 -> 2306664 bytes
> > 
> > Ok. You know that a single instance of the file had troubles getting
> > through. Now you are sending it twice when it's not required at all.
> > 
> > Please fix your setup so that git diff / git format-patch shows
> > renames are renames, not as an remove-and-add pair. Git does that
> > _by_default_, so it's something in your setup that changed this.
> > Please revert to the default behaviour.
> > 
> > This is how it looks by default:
> > 
> > diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_4v.mbn
> > similarity index 100%
> > rename from qcom/vpu-3.0/vpu30_4v.mbn
> > rename to qcom/vpu/vpu30_4v.mbn
> > 
> > Also please consider using GitLab MRs or pull requests instead of
> > sending huge emails with multi-megabyte binary patches. It's all
> > described in README.md. And I think it should have been added to
> > Qualcomm internal documentation on upstraming.
> I agree MR/PR is the right way to do it for larger binaries, in that case,
> should the README.md be updated to keep the approach limited to MR/PR ? I see
> the approach to send the bins as email is also mentioned as one of the approach.

It's included because it still is a possible approach. For example
Adreno GPU is several KB and doesn't require any special handling. On
the other hand, 2MB binaries are definitely an above the sane boundary.
I'd say, one uses their own discretion to decide of the best way to send
data. In the end, you are not sending 2MB source patches too. Well, I
hope you are not.

> 
> Regards,
> Vikash
> > 
> >>  5 files changed, 3 insertions(+), 1 deletion(-)
> >>  delete mode 100644 qcom/vpu-3.0/vpu30_4v.mbn
> >>  create mode 120000 qcom/vpu/vpu10_4v.mbn
> >>  create mode 120000 qcom/vpu/vpu20_4v.mbn
> > 
> > Please move files to the new location and provide backwards-compatible
> > links rather than doing that backwards and providing
> > forward-compatible links instead.
> > Also please use Link: tag in WHENCE instead of creating symlinks manually.
> > 
> >>  create mode 100644 qcom/vpu/vpu30_4v.mbn
> >>
> >> diff --git a/WHENCE b/WHENCE
> >> index 5e91462..876f562 100644
> >> --- a/WHENCE
> >> +++ b/WHENCE
> >> @@ -5942,7 +5942,7 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
> >>
> >>  Driver: iris - Qualcomm Iris video codec accelerator
> >>
> >> -File: qcom/vpu-3.0/vpu30_4v.mbn
> >> +File: qcom/vpu/vpu30_4v.mbn
> >>
> >>  Version: VIDEO.VPU.3.1-0076
> >>
> > 
> > [skipped two instances of vpu30_4v.mbn]
> > 
> >> diff --git a/qcom/vpu/vpu20_4v.mbn b/qcom/vpu/vpu20_4v.mbn
> >> new file mode 120000
> >> index 0000000..56cdfe6
> >> --- /dev/null
> >> +++ b/qcom/vpu/vpu20_4v.mbn
> >> @@ -0,0 +1 @@
> >> +../vpu-2.0/venus.mbn
> >> \ No newline at end of file
> > 
> > 
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
