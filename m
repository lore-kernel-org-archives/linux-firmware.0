Return-Path: <SRS0=WOkb=36=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF266CAC592
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 14:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8471C4CEF1; Fri, 19 Sep 2025 14:07:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A421C4CEF0
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A421C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9Conr011181
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7EIANb89BEomf1uEkm62rAj8
	IzdbVNBDry3TfdecrUM=; b=fGxSeqpS6zzRfyopulFiN0+AViqQKn3QQdLuREIL
	ExHu8BU8p74k4tWb1IxOHXfHGu8T51wjbUVMgod/8PzwPf7QLzYQ/9oMQSlo4Ohf
	sTXwdxlEzLIfIYWIc9jXNaLeJOFGOeGeGOrd2IJtnylix5IDnpqkGS9ZQZvm7CKd
	FaOdvE7e5FrAIwFSPx8MVZqpjCORnDqH343dtAfOIG5OJaDZwJq+GE9anU3Pjg8f
	+/XtBI2DpuMUpi4F4x8cxZgjIE4cipUg3gywAHHUpbi/rlKemaHe129WbVf0YZFa
	WpvkvrmLSWbdVheJm1HwsSFRWWpTiWM4VXd58jcbHrMYDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx6muh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:07:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b633847b94so49741961cf.3
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 07:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290867; x=1758895667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EIANb89BEomf1uEkm62rAj8IzdbVNBDry3TfdecrUM=;
        b=Iyi8GuIUsFloPwUpTxTetfo+F1TydSQyMhn+TGu7RZ6rAKcMUf2JutFeJY/4ZfRtEU
         AQwzL1EXqIsB2omWc+b6x9AvBkUI+1PRdVRg0Y9ehOkXwIxLLkPUW9yI2AfB+mvRtvnX
         0sflfuvq6aMqKIKfeZdZs7HjNHuL22Je06WVYYcocrLTaVIPaE56I0Jq8Pp2KLpy/Vzv
         PSZIszHiWhZGSLEAjlg9e8Ug5HrVlkE17LlzUyZI4LTFDfEX4drSJfJdeaBqOVy2y34k
         lcPnV+pPrwRwltgiqTyJ7GOyZtrrZjmLI5YUfgSvRSs8m8gJHU8tAEL8rKw5YEjfmESD
         oAsg==
X-Gm-Message-State: AOJu0Yw6gyIsYiZjCSaB3SuhHiyXEY2RWfyvtNRVx0AEn7uaTgo/rd8k
	hVwAr00p7X0sd5ueCjPb93QJ4/sY+xmdZIf8vffTy0hCpYkDiCeHIDeMjZqZG6fdHLuta1jYs2q
	fzMH4bFtHKSyIUGTqcN+E7C+55P+JUT66TQmtyYE9iIWEYzKSh8Ta/K1HAaN/jE+WEqWK3OI=
X-Gm-Gg: ASbGnctNiVvAGko4UYwHQAlqTkut0IOEToUu5PQy82Q+bAgnK8yQXaqv55kgR8LQ+BF
	qtL8YKCotnql+BwZcRL9lQYZwlIf3xwDEi+4xribHZ08PkhnQ9RMCj2ymcPs422RUyaIBscPfrw
	ico8oGqWDdvi0maK0uB7qEyl8bJckqASHg2G941lgdzxvgQMfCf3ze0Pg6AzMPsDz1aUZV5CcOv
	vHQIr+UkiqDFFspAO4DI/Amrilcl48uyvwxcTAs8tU/nI+p9OmsGCWDRyrKw9qK2+jPNd+SpK0p
	uJLhSvYlPoEwLgwPEMDr18uUCE/LoCpO9P7oBIhGt1pVv50iZ+fFwW9EF8g7xnOdqr17HkNNNK5
	bjHKmkJ0hiWd4QVTOvzn0ZlFtFK5wyOmJLUBy1klF/WGgXOcg5sNM
X-Received: by 2002:a05:622a:1cce:b0:4b4:9773:5863 with SMTP id d75a77b69052e-4c071428544mr30958581cf.48.1758290866839;
        Fri, 19 Sep 2025 07:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJBm79dzokCKz3md6LUMuAK6nuYOgnP/+aPf8gv/Il1JnuRVh7uTmi1AvDr4P46BH80v9Hgg==
X-Received: by 2002:ad4:5c44:0:b0:796:db6:98cc with SMTP id 6a1803df08f44-79910ca57ffmr42008896d6.7.1758290431759;
        Fri, 19 Sep 2025 07:00:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5793b1a828esm1077242e87.115.2025.09.19.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:00:30 -0700 (PDT)
Date: Fri, 19 Sep 2025 17:00:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
X-Proofpoint-ORIG-GUID: nA9Fqd18thxnNSxkZSXm4DnRPo2wN_oK
X-Proofpoint-GUID: nA9Fqd18thxnNSxkZSXm4DnRPo2wN_oK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfXyC7a2MWTce6u
 MdEwLbP2smYi8fRgIiYE87im8H/FpSDMKbIMsX8S9ppQHESOJggYygVfjGmOl5Otz5+ntmcvCFh
 rY0JyVY2nD/vOHm502fnmmgKQvp1DPGBiA0yg8GD5QfFLxBFd1NHdYpcNzmdZnoOnQM0Mhwc09A
 niYojLeApjII2WegS6mxWNsHWqfAfJpxJssbMT2Uw7ngJj3VhCUPX9hRSOVp6OrirXfq20O1kHd
 Axj17BJw9/xGILxCbRPZRsZFkd60jKeKB4dvmFyqoFz4DxHRdWpqnobrm3FPm8STUndHekI9Ybi
 kL8vhAQhQkMzf86ZWch+JyATYeKGoMPdAA+vPfSeGxcPQy4CfSI5FPRsdUM9Xx7aIxOMpXHMVZU
 qPhB0LGA
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cd63b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=4MwoUhHJQoa0W9kE-8QA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219

On Fri, Sep 19, 2025 at 12:26:03PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/18/2025 5:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>>>
> >>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>>>
> >>>>>>>> are available in the Git repository at:
> >>>>>>>>
> >>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>>>> video-fw-qcm6490-update
> >>>>>>>>
> >>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>>>
> >>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>>>> +0530)
> >>>>>>>
> >>>>>>> From the commit log:
> >>>>>>>
> >>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>>>
> >>>>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>>>> profile and thus different MBN header versions.
> >>>>>>>
> >>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>>>
> >>>>>> its the same case here, qcm6490 also required MBN header v6.
> >>>>>
> >>>>> But why do we need to mention that it's v6?
> >>>>
> >>>> we need this to be able to distinguish from the firmware binaries which
> >>>> doesn't need v6 header, we are following the same for other SOCs as well.
> >>>
> >>> Do we have anything to distinguish from?
> >>
> >> As of now, we don't. But in future if a new firmware is needed for the same
> >> hardware generation which doesn't need MBN header v6, how would be distinguish?
> >>
> >> So either we keep the name with _v6 now or change it later when a new
> >> firmware is uploaded which doesn't need v6.
> >>
> >>>
> >>>>>>> Last, but not least, is this firmware used at all? The venus driver uses
> >>>>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
> >>>>>>
> >>>>>> its used here
> >>>>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
> >>>>>
> >>>>> Hmm, why is it using a firmware file different from the upstream venus
> >>>>> driver?
> >>>>>
> >>>>
> >>>> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
> >>>
> >>> This doesn't make sense, QCM6490 and SC7280 are the same thing.
> >>
> >> yes, they are same hardware, while it is one of those fortunate hardware
> >> generation which have the implementation in both gen1 and gen2 firmware
> >> interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
> >> uses gen1.
> > 
> > What does it mean? There is no board-level difference nor SoC-level
> > difference.
> > 
> >> Given that they are same hardware, we use the same bindings.
> > 
> > Now consider the OEM having the fused device and OEM-signed binary. How
> > would it work? Will venus work if it's a gen2 firmware? No. Will your
> > driver work if it's gen1 firmware? Also no. You can't randomly change
> > the firmware interface in the middle of the platform lifecycle without
> > providing a back-compatibiltiy.
> 
> I understand your concern. To clarify, we are not removing support for the
> existing Gen1 firmware, so backward compatibility remains intact.
> 
> We are simply adding support for Gen2 firmware for this architecture. As a
> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> Gen2 firmware (via Qualcomm's video driver [1]).
> 
> Additionally, as part of our plan to transition all Venus-supported targets
> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> to maintain backward compatibility.

Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
interchangeable for the hardware they both support, until the venus
driver drops support for V6 hardware. At that point it's expected that
there will be no V6 support in Venus driver.

You can not simply upgrade to Gen2 firmware as if nothing happened.
Consider a device node on SC7280 / QCS6490 with the firmware-name
pointing to OEM-signed firmware. Both Venus and Iris drivers would
happily consume the device node and try to work with it. One will work,
another one will fail. This is definitely not what we have agreed upon,
when you started adding Iris driver.

> 
> [1]: https://github.com/qualcomm-linux/video-driver
> 
> Thanks,
> Dikshita
> > 

-- 
With best wishes
Dmitry
