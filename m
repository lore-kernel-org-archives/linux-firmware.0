Return-Path: <SRS0=yYLr=32=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E4CAC597
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Sep 2025 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2841CC4CEF1; Mon, 15 Sep 2025 12:00:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4660CC19422
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4660CC19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FwhJ018224
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3yT+RvLy5nxMkTurfUTMlhqB
	yUSwWzjPh8NJpZHwzHU=; b=byNn4N/i6+tK+5GOJB/aaEEdU6HUtNLtdnANz73D
	814i8I7vvgsjGegYjDeA/UscgMLV12gpLNX3BaOhwCI9zFXpXd9W9O16geTm4L6C
	Qi3/zk091kzb4zheZ7kogB9QCSlojbEKS8RiPtXNfQkvj4S+9ibgPk2fYgHDqzxC
	Ln4bEiuXi6NLVj3ybhwit4KQvl61WokaBG+3MAK4sPa7wk7Pa/Kktr+yHixAKsZ9
	1dbHjzWSfL5vNo6Bb/BXaLjTh/vS5tEbOrRlIEa/BGLc+aoUz835c6HS5sSxCeFC
	lYSQYoxfDJAZpY2E+TrdOBIE1aGgZiNcpbG5P7q3KpQirQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u54rap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:59:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-77d39d8f55aso19283206d6.0
        for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 04:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937549; x=1758542349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yT+RvLy5nxMkTurfUTMlhqByUSwWzjPh8NJpZHwzHU=;
        b=d5zIb+XWNINNqbyGdHmUN2vl+rJ4ym6n9QHqxBET76SdjJ6Q9fgIMe081WSrFM/Ty4
         cWqSaeAgI5KBaT7B1gwnzVnYPKwiCUBawGF7kSclw2smHh8QMiYUE8mHLQiJR7IE0u9T
         nkJ7q7mlW1YA32EJ3bZ/d/Ycz83OafFoYRTxEjRbSWRiC4wmv210+3nxOwznFOd3SzNe
         LnmVZfr/h2dmW0q1CJwElKUJif4wlcHNL7X3aqzz4zNMgewFxmOL7FKYMzmc/yiqMPkv
         0Zp5grED7M6nQh9m17HsB0ftJqQLWD3D70X4NPhGcRu4GvaCycJOD/lPcAEbdB13Xxzm
         0Bdg==
X-Gm-Message-State: AOJu0Yz+sNyZvWOtyUWVzT7S6Vg1QS6/8CjqClU7ZjNLkV9qkpiIlG8U
	ArRQ8WYVf+FsidCIFooBM3uUIQkUu0nVKO3QWhMCfXA9xE4GxYwiwSVjG4XNpidzbmJTy+e1k5B
	bdDjNQ/tvY2QNyWZaeixdHV0ZEbohnDyG8l1BxVeydLc21x94XaJ8F8MPliLHyCYGVSktDpY=
X-Gm-Gg: ASbGncsHHgyr9aK/aupBC9aLv/v4IUEIoBHIC+IFlsZ+mpq7FJw3U0n60TU5Wy0nJj4
	6MgF6MM7SZwEsyWLOZh8ogkzZfXXNpHWmFgWBCqOKddDfcwR0D/6UaN3qwTDSIk8B7CJ535yGG9
	BX9vcmkl9FSIiLL6NlXMqWmokt/I4cQY9K2R/86W1Bdpx6NDhZskq3x8ZiTdPQVlNiAttsi5Qm0
	LCSjzYyJU7VjmAc1igAmt6iALD4La5ySHRQah2zz16KJt4ilyLVDAlmXoagdRt9V2blGXCjWu0Z
	11H1PsvlJYj+mSzKaxTFPkPxlFMhEGaxdhTuIBfH2CbvsIWoHoWintH7h4VP5cIBrreZngfgIm7
	O0ig1qElSmsZVpgyIgyoyEhzua1w40U7b7gm9+cLZap0/j+uowdw7
X-Received: by 2002:a05:6214:d06:b0:782:ef53:7d41 with SMTP id 6a1803df08f44-782ef537f0dmr25328006d6.33.1757937548658;
        Mon, 15 Sep 2025 04:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr1T2J/fntLgeP4cBtSCt7Tk7NZwS3bPvmMFX8tiKi/1Fr2w5/QkFeni0SzuvcZEGVjjQkLA==
X-Received: by 2002:a05:6214:d06:b0:782:ef53:7d41 with SMTP id 6a1803df08f44-782ef537f0dmr25327666d6.33.1757937548037;
        Mon, 15 Sep 2025 04:59:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f15a582b3sm25919821fa.14.2025.09.15.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:59:07 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
X-Proofpoint-GUID: kvsbaj0ECZi-AOlpuF-or-MAqgl_a4xZ
X-Proofpoint-ORIG-GUID: kvsbaj0ECZi-AOlpuF-or-MAqgl_a4xZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX/3FH1pvv9ith
 voHwUlm0ldNaRH9RUCNlMVa48YkwR4PC32niKulnYlHNA5H1/m3X+Izn8R0zNEefyo5huYmoos4
 1RnPPBvd67KkItnNWJ5FxY/FWJ3gF2l9JWWEWT36kTDyABilx7nvOTqZqB94xg8rwjxWG1FWBtf
 F1KW9JJfmINFnxvKZuZM6fwDg0xvwm2b9MxSYRFnSkunQxfXTL2wLhdCPekaOxT5Iijh5toFNLh
 8p2F6jHRivyW9QYI7mUhl0ZLGQOV1syVJQ8H0o7A2hsmlHDhpQp86feB/Y/b3EXiKmqdxiFvoCs
 3IaBy8ICAYnLH+iTGZ7d8O0GwIbnnfaYVq7QRoyC/jQZ6gMGTR3caM0SRPCVwTX0F6b1guSRSav
 rG1BVFFV
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c7ff8e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=m7i--uD9nk620fu4c7MA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >> Hi,
> >>
> >> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>
> >>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-qcm6490-update
> >>
> >> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>
> >>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >> +0530)
> > 
> > From the commit log:
> > 
> >> Fix the firmware binary name to reflect the correct sectool being used
> >> for signing. Also update the version to add some recent fixes.
> > 
> > Using different sectoosl isn't a determining factor. It's the security
> > profile and thus different MBN header versions.
> > 
> > However, why is it important here? We have added vpu30_p4_s6 for the
> > sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> > v7). Do we have such an issue with vpu20_p1_gen2?
> 
> its the same case here, qcm6490 also required MBN header v6.

But why do we need to mention that it's v6?

> 
> > 
> > Last, but not least, is this firmware used at all? The venus driver uses
> > qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
> 
> its used here
> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423

Hmm, why is it using a firmware file different from the upstream venus
driver?

> 
> > 
> >>
> >> ----------------------------------------------------------------
> >> Dikshita Agarwal (1):
> >>       qcom: vpu: fix the firmware binary name for qcm6490
> >>
> >>  WHENCE                                               |   4 ++--
> >>  qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} | Bin 2036328 ->
> > 
> > It should be vpu20_p1_gen2_s6 then.
> 
> Ok.
> 
> > 
> >> 2031844 bytes
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>  rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} (73%)
> >>
> >>
> >> Thanks,
> >> Dikshita
> > 

-- 
With best wishes
Dmitry
