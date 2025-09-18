Return-Path: <SRS0=8enH=35=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF079CAC5A0
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 12:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A05B5C4CEEB; Thu, 18 Sep 2025 12:17:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8ED22C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8ED22C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBE53J018235
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Itet9rG6fb4GwQNZuOnBdKm
	1Zkpw7SSj1KiGx9AUNI=; b=XhvuQKp4bsQZPO6nR9UT/4ChA0vSNvSWrZ6BfHsB
	HbY6rsUW10IBnQtYOTILIuxSwOEg8ranQXz0sGmQZuWDAxUSkf8YscBHO5YqH2VE
	y6zoRpIUO7d8niJgJUyLZTpv/EgAzjvT+Glexv6gVehe9c/rFdy4cyPmUgRnoMDP
	QvTcVoGExeSU2qBhLcD9ha0dxshHIBEwHs/fB6tqwlvQJBNfGI9RCKE5k/yHLQHz
	xKV/gGaxsrvG/YJCcrUHn6+ogx+iKZCR7jZml4KKOWCGM4nyr/USV9b0Yec2K5Ne
	3YoWvmzGFTAiZ8jq5UsDSzlzsaUl+qEglpkJrvFsFRRabw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwe88a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:17:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-718cb6230afso16010376d6.0
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758197866; x=1758802666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Itet9rG6fb4GwQNZuOnBdKm1Zkpw7SSj1KiGx9AUNI=;
        b=OtApxfA5pi0PCP2k0VkyzKRUQr8fL2MR4PjHbJHlak7FDjDfMsBbIkClSlajDHiOBi
         F+AJheWMenTLPgA8M1ZOd52YlyNu350HiGunztZx0qkO2n8yThui/97hB3gb+wMMrYm+
         Jd1jn8+jVLSGXROMZ36r9FSXSpdkaoLhCqr0n4Amva91rEDauzV8aWLCA+1C947Ympwc
         2XFGrxMUzLetC/99lYjVOqH8MpZfXFQO3ytOTyJHmyTauYHpHk9DYiK6KPz/M7GsctLG
         /1KVnBhaJGDn17RJXOzp3OdVJC0N/mzhRIO9njlL6K7KualKkFbNfRfxlIX+awhWhAGs
         UpDA==
X-Gm-Message-State: AOJu0YyKRMN4/2qLVdlM7LQI7pzIt58CP8v8PY+V3yTOlrsl7VmFGDID
	pe5XniDXHYgGhCaAOhNm7P9KEdWmyo7wyQfvf5I0rtwxInhvR1w52pkt5AlLX31Vpca3SiHme8R
	40L6JqJHiBnKqAUIlgaR0tC616iTS3XNSgkwinfEkCrdJgcfThkDHfsb96LnynQk=
X-Gm-Gg: ASbGncssptcQCrF4Rakr78+9OcJSThp8Gh7xVjhQhLizyUTm+yVKmzzKvBv7Qm2Gv12
	fu9zaLruDrouV6harp7sHVKWr6Qe3U8vJ0LRUEw0pEVaailVyn7GVVq9GShxdYHpUCZW3chSQdr
	tZ8aqLMmVJKEJ78AOAhuoxLJ8eK0slH4/9SNZezcSF+UP8GUsvDuPOtNdcgzTZlxPgL2nWTUQKg
	cCW39uvPlFxus7yd9+ZIvTNilV/XVAhrqWo4cS2W13LG8dYUyWOp/ev22nA96yy9RyvcqYIellz
	n/Qws9QZ5JTN0W/ojsd8KpZsgHy2EStuL/Vx4213Zf8lVp8uifmzMvfBAVRGJylo7O4++zC6GFI
	FkkyGol1JWeUZ4Wb1pVpia+WLZkT4l9j4xrBreUe/cRlIkTjsJ6pG
X-Received: by 2002:a05:6214:b6b:b0:722:970:3af1 with SMTP id 6a1803df08f44-78eccefdc50mr53527866d6.22.1758197866171;
        Thu, 18 Sep 2025 05:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWF4+W1L6WjcxisuVPQrD8lnIkXT1rrTTQbTpUtS8TVOaX/kiWU/GxM//V59Ss4uwV2Sl12Q==
X-Received: by 2002:a05:6214:b6b:b0:722:970:3af1 with SMTP id 6a1803df08f44-78eccefdc50mr53527456d6.22.1758197865582;
        Thu, 18 Sep 2025 05:17:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3628559a89dsm3435441fa.66.2025.09.18.05.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 05:17:44 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:17:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cbf86b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=7GwAqnDnSfAZpGVhMSMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXywn10Uxt84UI
 QkWi+jVmYGFysmZbIXwqgiMeMHcy+d+uHhQDlS/mdqAhAuc3PlrqXGj4NZyvTbOAwtl71SMQ++p
 J7JmVAr6ZrBGvI3RT57skfgn0XRgL3XpeqZviFNkphBI0yMhLfbpiSgM3SD9o2jkB6wK9aSv2bR
 /ITIdFAaO2idpc2MhnH05vaaKmPvPAp1aojVv7XVNAfkd2fyqWOeVYCmqw6YQ7K/f1t8yg58Llh
 joiqRwiKtycOfZMFySUtGQ8x4Vm/gBK59gGOeXOZUTeb/iF+KzGMb4+bezgyWYrVKOf/2o4Jucw
 zlPiTSFq9nZ1pl7ENfENmb6a0rivFjHYbem+SBcpZV42+GaHVK4+iFyMcFtipipGydlvabDGINW
 5pvEnFrw
X-Proofpoint-GUID: uyh0cFCfubo4CAC-sE4Cp4zFLmwDUFOh
X-Proofpoint-ORIG-GUID: uyh0cFCfubo4CAC-sE4Cp4zFLmwDUFOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>
> >>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>
> >>>>>> are available in the Git repository at:
> >>>>>>
> >>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>> video-fw-qcm6490-update
> >>>>>>
> >>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>
> >>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>> +0530)
> >>>>>
> >>>>> From the commit log:
> >>>>>
> >>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>
> >>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>> profile and thus different MBN header versions.
> >>>>>
> >>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>
> >>>> its the same case here, qcm6490 also required MBN header v6.
> >>>
> >>> But why do we need to mention that it's v6?
> >>
> >> we need this to be able to distinguish from the firmware binaries which
> >> doesn't need v6 header, we are following the same for other SOCs as well.
> > 
> > Do we have anything to distinguish from?
> 
> As of now, we don't. But in future if a new firmware is needed for the same
> hardware generation which doesn't need MBN header v6, how would be distinguish?
> 
> So either we keep the name with _v6 now or change it later when a new
> firmware is uploaded which doesn't need v6.
> 
> > 
> >>>>> Last, but not least, is this firmware used at all? The venus driver uses
> >>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
> >>>>
> >>>> its used here
> >>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
> >>>
> >>> Hmm, why is it using a firmware file different from the upstream venus
> >>> driver?
> >>>
> >>
> >> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
> > 
> > This doesn't make sense, QCM6490 and SC7280 are the same thing.
> 
> yes, they are same hardware, while it is one of those fortunate hardware
> generation which have the implementation in both gen1 and gen2 firmware
> interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
> uses gen1.

What does it mean? There is no board-level difference nor SoC-level
difference.

> Given that they are same hardware, we use the same bindings.

Now consider the OEM having the fused device and OEM-signed binary. How
would it work? Will venus work if it's a gen2 firmware? No. Will your
driver work if it's gen1 firmware? Also no. You can't randomly change
the firmware interface in the middle of the platform lifecycle without
providing a back-compatibiltiy.

-- 
With best wishes
Dmitry
