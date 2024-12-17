Return-Path: <SRS0=2557=TK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69ADE7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 12:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A4BFC4CED4; Tue, 17 Dec 2024 12:07:22 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 769E5C4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 12:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 769E5C4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5664781e87.0
        for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734437240; x=1735042040; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GNHvr2xcAkasW9rPE/4s/CoVk6OpUUpj3cYQL0ec8Zo=;
        b=Q7zUa9nQDAK14FpHM/4h/PqlRdXn/gWqtuKvG2SSg5Bro6470ybKDy3iDfnqIa1N7B
         3gI+B5kPy2WMWB8xj7SLLKpsULVIdVDPyO7Q5xwWt5V6mUnzesI0/flq3L75MxRkyKXt
         BI3ciY12wPg1s4Crw5+PY/pqgL3+MNpyxA17il/VXqO0ncjyPaR0oUMbxypcimEI9tyZ
         IrYdFDHcV2g1CRfsL5pXaS5py8lrM5drKDx/eE1l9k7wHXinufaTW2AH80fJUqfl9m2M
         bo6e+DCkhrVVP1m4ZykIwDwRz9F3z/bOH8ldj9pnbMzXgMuMs2cynsB+da8g+YdeOD4J
         Q8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734437240; x=1735042040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNHvr2xcAkasW9rPE/4s/CoVk6OpUUpj3cYQL0ec8Zo=;
        b=YHef3np1+m9F8cowbKKLVDy19TFVxo4QGlDEDLM4hUJ1gL+pMCvBzwwlOLoO6cFnKK
         ciFd3THdFZ9nJY2Tmy0VzJlQ0DqIO4hPwptjJ2Cb8AIP6sHXt7d22XXG/aBoQNdTEwHb
         VNczVdZO4szB2HCbey00VQMTM8/nElkzCFAHwKY4V9F7EZM+5eTWf9CZcTC+i1MO4130
         sLGh2FQq77rMsQ6qg7rcs5xDd6B2tZi8qu9nsqLJ1sSKbZ9rNEDc/VuJWKzI43MLvfRc
         UriqCT8y1pEKBnIL/yo/WCSayL6l4wihEEtjKFzz4VsHhyLeBr9ImtrHU7+oa48/NRJA
         5YCQ==
X-Gm-Message-State: AOJu0YyiGryPfqQ96UkIgUBiFP7Wv3dQJ5UOtn87EyR83NJz1WMRhAWG
	QED9O7tYyxuaLCMTlKXA3SbvI5ksdhv3uYC8j9Ip8s5cDK/C62hWzo2G3XgjODA=
X-Gm-Gg: ASbGncvQ/nakxCejlK8jXrDqnmQazfMz0gxDSQm7PwuYfjTKj34kD7fqs2d9aKTPn3B
	gU1U8JVb4liNctDFcJtrkQ/yiF/ljY+hn/WbzaGCuDwBwFUlXBym423n5v63DIJpI1v/eHoZRDL
	f3PuzTa5HqoJeai8A+GaaQceIkOylWndVfw4xSioCv6tCojl5Zek66sYHbMR79Kkx0NkNo+IV79
	z/UiscixHcTASqeYZQvdfjzO4WBBsDM4LrkSQ2IA7gj7pLFkP9zlgK5/2EpDpAJonStGcBCi+o4
	DJiVIY7evjLrofnLMC7NdSDlUEpoV1FbqJtP
X-Google-Smtp-Source: AGHT+IHQY4feCbK+xlMPnMxenIVKMSUbGoOSV/JE/cizTJllqm19/aE5HrUH7pj80f/6VlXBvUMnYw==
X-Received: by 2002:a05:6512:3f04:b0:541:324e:d3ac with SMTP id 2adb3069b0e04-541324ed414mr570181e87.3.1734437239585;
        Tue, 17 Dec 2024 04:07:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c1fae3sm1135327e87.239.2024.12.17.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:07:19 -0800 (PST)
Date: Tue, 17 Dec 2024 14:07:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: update firmware binary for sc7180 and qcs615
Message-ID: <rxoicrvyx4vob3skbzrpnxfh4jk6talcn3pkkxb6pupnj3tykp@sppjerlk45ov>
References: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
 <CAA8EJppvAPmneYtixMhACf7NJdOX837UFuFdVCzbzBDMOSDR0Q@mail.gmail.com>
 <f2867d67-8b89-fcff-80c2-3de46806a590@quicinc.com>
 <CAA8EJpo+6r61Fcu-jzjdcrT6ifkmTHua5sdsuDpfZwZuo=JEBA@mail.gmail.com>
 <0a0ca412-bbf3-8411-5de1-155098b1811f@quicinc.com>
 <bb1b636d-8b17-6061-ecc1-8568bbd9e9bc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb1b636d-8b17-6061-ecc1-8568bbd9e9bc@quicinc.com>

On Tue, Dec 17, 2024 at 04:27:36PM +0530, Dikshita Agarwal wrote:
> Hi Josh,
> 
> Here is the updated pull request. please let me know if a new mail is
> required for the same.
> 
> The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:
> 
>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-SC7180-QCS615
> 
> for you to fetch changes up to 9778d18566912efa6c811ffde4cf4432a8990e85:
> 
>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
> 16:19:47 +0530)

Could you please clarify: previously you've had the same FW version for
SC7180 and for QCS615, just two different binaries. Now you are
providing a single binary with the updated version. Are there any
additional changes between those two versions? Or is it just a change
in the signatures?

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: venus-5.4: update firmware binary for sc7180 and qcs615
> 
>  WHENCE                      |   3 +--
>  qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
>  qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  delete mode 100644 qcom/venus-5.4/venus_s6.mbn
> 
> 
> Thanks,
> Dikshita
> 
> On 12/17/2024 4:22 PM, Dikshita Agarwal wrote:
> > 
> > 
> > On 12/17/2024 4:19 PM, Dmitry Baryshkov wrote:
> >> On Tue, 17 Dec 2024 at 12:48, Dikshita Agarwal
> >> <quic_dikshita@quicinc.com> wrote:
> >>>
> >>>
> >>>
> >>> On 12/17/2024 4:12 PM, Dmitry Baryshkov wrote:
> >>>> Hi Dikshita,
> >>>>
> >>>> On Tue, 17 Dec 2024 at 08:10, Dikshita Agarwal
> >>>> <quic_dikshita@quicinc.com> wrote:
> >>>>>
> >>>>> Hi Josh,
> >>>>>
> >>>>> Please pull below change, and as discussed, skipped creating symlink for now.
> >>>>
> >>>> It's sad to see that this change wasn't even verified:
> >>>>
> >>> My Apologies for missing that.
> >>>> $ make check
> >>>> [...]
> >>>> E: qcom/venus-5.4/venus_s6.mbn listed in WHENCE does not exist
> >>>>
> >>>> Not to mention that you Josh nearly asked to add the symlink in his
> >>>> response: "...but you likely want to include a symlink for
> >>>> venus_s6.mbn ..."
> >>>> I had a discussion with Josh regarding the symlink and he agreed to skip it
> >>> for now.
> >>
> >> Please keep such discussions in public.
> > Noted.
> >>
> >>>
> >>> Thanks,
> >>> Dikshita
> >>>>>
> >>>>> The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:
> >>>>>
> >>>>>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)
> >>>>>
> >>>>> are available in the Git repository at:
> >>>>>
> >>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>> video-fw-SC7180-QCS615
> >>>>>
> >>>>> for you to fetch changes up to 07479dbb62054d362a206e71c2e4cb52181c81d4:
> >>>>>
> >>>>>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
> >>>>> 11:36:00 +0530)
> >>>>>
> >>>>> ----------------------------------------------------------------
> >>>>> Dikshita Agarwal (1):
> >>>>>       qcom: venus-5.4: update firmware binary for sc7180 and qcs615
> >>>>>
> >>>>>  WHENCE                      |   2 +-
> >>>>>  qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
> >>>>>  qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
> >>>>>  3 files changed, 1 insertion(+), 1 deletion(-)
> >>>>>  delete mode 100644 qcom/venus-5.4/venus_s6.mbn
> >>>>>
> >>>>> Thanks,
> >>>>> Dikshita
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>

-- 
With best wishes
Dmitry
