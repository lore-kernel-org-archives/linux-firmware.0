Return-Path: <SRS0=3+jE=GG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39A5C5B572
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 10:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC19D1F00A3A; Thu, 13 Aug 2026 10:34:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786617292;
	b=uywR8E+2DhfWTq5PR8leLOSi7bekbxxppPHVj0JMp3sEOYvzDqQ1H5YYRiQNmtoEbfRH
	 od0YroYg4iPeG89gGa4ULVE1SQneTFw233VWPzSTZ1mXhgB/PuiKE7p79f0vyRL8RtjU9
	 GwlbEhvk+4ycu2xVE56hX3SHrFefhbzgxhNaezdS6O9e9GjKQDLBLgtN/N7Lyp1xO8J95
	 sCDhQUUCrxcs1KClNA1ncOTZvSYWlrieInf4gewICrnc6HtWacl29TEiCOCS/J5nuiEyB
	 NkZ/5aFJi8IqElHDmOBq03sJqezqlw3n1V1/SA8OHuf3ZdemkPhpN8zgCD+BsmY4kTg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786617292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sRsURPzg5MV/zbrkCKg2NAQteV2Q1VA0m87AAua30So=;
	b=NkODDsT1w7awzJMkaqW6dATcgVa3nmvh6j9RIpJefm8sL8mcQx56oVVfc/XjxnrYmKSG
	 bdy9XuzHDzZ1a252FsiSFHlzFH0LhHwYSaBL7qgXlQzjE/r/GAZUWq2yYgoKV5Y7b1zfI
	 0l4pT/TwyAj2D0iN4zhBo1KrvIOZI4UYhO2TXJX/DYOmcByxfJbG/AwnpoTD5zPWgjwIR
	 4PLf5++PfIkmqn56Q5rGRQ4qOeu8TMw9Ds+YNKj8OudNqaF85ndN4dB4rAmh6xKdKsep1
	 G1q3iYbKPGsbL4Yff7wkMh1khFyZ/I9tHFtfSrF9H/J1xeGWYn5cs2OI+RSi3F++O6w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxtBGcn9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKIRFtnt;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E94691F000E9
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxtBGcn9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aKIRFtnt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E94691F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D92DSf2326208
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sRsURPzg5MV/zbrkCKg2NAQt
	eV2Q1VA0m87AAua30So=; b=cxtBGcn9RY4qZMSpYuedukbvVQdfug8vjpuyzMBR
	+BhiLHgdZP1j9vVEiHiPmr07fe44E5OIZRsBccuPAGmgCMEMPzunvmdLuf9PU7nD
	50gxeEl2UmARlopmlEdZhO+Wfmu+27kmIwjVc6tdhRSbYdojVvNvrMm+fuLydLl4
	kVZmHm4xrkwsI97X83aYQnVpp3v9gRe+dcrxVGCcwiMrhnJUFo1tg+yKao4NoiHy
	5TwRNCo3lFH/4x3U6MXwBCjKOUhpRlkwBeDi1aqmhNICRRTsP/Ua1xQiFc29z/09
	1o+18o/+TV03M+P6gMXFfp48Q+y5iGehj2p2dKzKvM99bw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11asjkq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:34:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so773272a12.3
        for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 03:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786617290; cv=none;
        d=google.com; s=arc-20260327;
        b=suETPXjH1+RfDdSEbgFfz+sdpIERzi4L0euF2MRQ2cu1hW1kwxkniGMq7QneysgDhz
         Gnb7qKDN6GiDTRteiAI6CBhVLICPzQj1I2OCFIAnYtVJbDOD9jZCWO3npXw95LZyr4GQ
         1iWf8PzRlrO+jZEaeBZTgRwoqiasYEUJBwTblbsk4AGRzOD9+AYQamZdIeLF/3OpuAv3
         TxvHEuNmWRiupriQmtrGYUqBsrsTY00PxZBWuzllhUTCEV52MYgnQMi3hARUG3xsROU+
         pcb2iuLugIarwXJVEZugIU/bxJq7ys2qgI3FP4t+bsBhZByckEcL+C57OXOy7GFCL9yN
         krkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sRsURPzg5MV/zbrkCKg2NAQteV2Q1VA0m87AAua30So=;
        fh=EyL0vxBl/pOnLgFiXBvDF4KrZ3COxosl8Xm5ovlFbrs=;
        b=TIh2B6/ESopdRnXMe44Q4N8UBXMwxOCV2Yj1EPAFS6FW7GMrzqcK/5wd8SF4ic9XR3
         QzglTSYZMYXvObCRC8BfIaqLPmTOnO0sXwSIUouc9NgeBXca6P6isETqzqXlse2ZCPZn
         jCHbW6EJQEhp8gai2QkUBxqRV+YVfmNP33SzwgvOYp68p8X0zHWu8+MxnCt/pkJyA7T4
         Ths1kEqPMn7Q8qf/vIheUj7QSADlmUUkrirN6uJtH5Q2WyhFgyG1kBL2eUjNZQBwkRfT
         H0jZFOX6Px8NDR8cRl8hcCtYpmnRApgs0/qO0sUrRJoq32U1f5kpaSIuV+I6yYxKd6SR
         M/Lw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786617290; x=1787222090; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRsURPzg5MV/zbrkCKg2NAQteV2Q1VA0m87AAua30So=;
        b=aKIRFtntVdgowTgkMf/veE+iUDajCPhBIXJomLOqT+XWtSiJW1JmLq9BIoci10bEgU
         a1BZtg9phGMuqJaO/CDbcX9GjLM327H2w1kTkfc/R3prC/HM28vXWgpWm1dJG5kZaKXL
         40ykZ7htAIgtL6jeARYAx+r2+A5nvgnEBm+JAAoznnIWSg8R2N7AnBjCRVggiVsZJQWk
         z++H/+RoAHJE7ezy/CVxXoQOgWRKgbyAlW0DNKHx16NnuIRH45dFPfMpNV1HqM36Iyar
         N/XvnsJApvuOS8zmQo8faIHD1WmG02J259OfhUrxowMsLC7vSVSGRhTSgfHZqRT55PhT
         q6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786617290; x=1787222090;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sRsURPzg5MV/zbrkCKg2NAQteV2Q1VA0m87AAua30So=;
        b=fd1t5SKGveSP+4UR7RtBAjwlvjCUnt8t2VmjXyI0d8zbPoBZSLfYQ78IlZ2Ov/8aSb
         niDr82zKtblUjH5HduBPHP2qVr8RRo22Xn5oYhBUz3dbpDPiL2mELWKq7uPEiou4eKrR
         G0LadMtShuKeJk9wNIJ2bknw8ETEpvb88j7PhfvCrXcQ5Cq+1bN3YWGlHdHW/Jd9jfIQ
         YSrG/8lhYCageZHPZa6CRIjv7XFyhE/7sZcewsZ3WbzF2l6SKVOInAMG9xhMrsBUXG2y
         sXKB9R1aBNHdhg0okqeVNv1+E09TNVE3CAYzMvTdpOd5B1O7j0AdE+wkpky6uSR+nzI4
         hLBg==
X-Gm-Message-State: AOJu0Yx13UbP5zBLA0CumA1T6UlqOGPOtWLpBThpiz0K7m8t1eX0s11z
	JVZyR9j9UXFTpui+wrGrcBKRQbeeVuYQcQZAH9MfmzHtVMsLOn7f+cuPnFxr9W3xUjzgIdpBXWt
	w7g6zJw+8lH25vgZBkFEerrqZhG2MKlhI6xBKDtaQq8gp45YtO2+JM06STWnsMi6EnXeKONNciw
	eKza2C1ofu44I7G1HFuSjbqGPJ0T8d+Ii+9szqUw==
X-Gm-Gg: AR+sD10lRedJv3QVbxdvqQkZb82kohZmVmadVEZ5EipisS37cRl86Tom2u7WZdrxpWK
	EoUWlvsWNcYJO7vuO7Gusgg/6ZUODasxpLIpHfMGkg7lrGP4GsfnyrSKShUj7y4OnIbn0O4GaE7
	Vr1U4hPZA7YS62eFPWFMEKhEllym0Dk/iu71OYl9VLcVV7FW69LpnBBg==
X-Received: by 2002:a17:90b:5828:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3931e256dd9mr5914500a91.16.1786617289639;
        Thu, 13 Aug 2026 03:34:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:380:105f:8ffd with SMTP id
 98e67ed59e1d1-3931e256dd9mr5914440a91.16.1786617289094; Thu, 13 Aug 2026
 03:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
 <frgcq2r5bogzqtv2ft62btse6ns5iy3s6lfebes5iskrposcz4@hezpjlc4wgmd>
 <2c91a37b-77d2-4894-bb38-e6dfcc882f36@oss.qualcomm.com> <3qw35vkk4cqdop2resye6hirjjnkxrk7ceb3cctckpduu47vsx@dr4f3g6jdmbv>
 <48254a82-1d82-44a7-8717-0600e1de87ee@oss.qualcomm.com>
In-Reply-To: <48254a82-1d82-44a7-8717-0600e1de87ee@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 13:34:38 +0300
X-Gm-Features: AUfX_mxSHy8srIuLCu5lRD-6VU_2eRgWheiNSe2ymQQYHA1ttjcQ8fNKX5Ka6oc
Message-ID: <CAO9ioeUp01TxreWF3GrV6mfk6No_pamzkqUVB58updfbfo69uw@mail.gmail.com>
Subject: Re: qcom: add NSP firmware for nords platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d9dca cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=pYmK1v_XM6c3yNh0V_4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3MyBTYWx0ZWRfX66Zw+Z+1l3C6
 Y4tg9C3uiKTs8Y8tuU64oaVG1I1Nfo3ftQuCxTcP+6vgtAMbbvCBChL3cZyYMe9Ie6VanhMZWpz
 6RW1u+Zy5+xWFBKnFFbgxrKtn/SB7McD2GgZC5Ez2H+lja3xeHFblyIvUbvqJY3SRk6JSMOBdE6
 q38g0W8kCQ9XjJkOfGJ6ftmyy4RhmHOVpb0+ggKcktoqgKyClcRhcbRYWwCSamKNmRH2eOJjah7
 mr0oR+sO1K8oMeaZE90eeuMCTz68OYSUyo5EJqvlWWa+UhvvhlqGhSnvSth76QoQqs519YFR0y1
 tFAZRGslhna85Pef+48hsp2jIYmSCiNZ3/pxyYGpqAV362f1rdHjGdS9X2eZF0LBVSx1FqtunJJ
 eGFo13y/fcCiSvxCRi+j0GFLuS3+8NldcsH3IXYIVMdcC/4QfXgxg1PwpTTH+qfQjM98ucoAa9U
 BzH3sfKb1jokrl97GIw==
X-Proofpoint-GUID: umxsAcAr97E0ABiUsR5yA7Q2KKbAjXWa
X-Proofpoint-ORIG-GUID: umxsAcAr97E0ABiUsR5yA7Q2KKbAjXWa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3MyBTYWx0ZWRfX47yR5OwMRPuS
 Nl2vXCgcZkpWmdtT1GzhWrO8FbW9hcrbTFZPrucaCMIecEvBseK6+YQo5lbyivfBwk1yoLsJox9
 cLBTptjfhQh+zG+aRC8ceHYIVutuLdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130073

On Thu, 13 Aug 2026 at 13:26, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 8/13/2026 3:20 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 13, 2026 at 10:16:57AM +0530, Venkata Kota wrote:
> >>
> >>
> >> On 8/12/2026 5:48 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
> >>>> The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
> >>>>
> >>>>     Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
> >>>> +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>> dspfw-qli-nordsnsp
> >>>>
> >>>> for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
> >>>>
> >>>>     qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)
> >>>
> >>> Is the firmware for those instances that different? Can we please have a
> >>> single binary for all four CDSP instances?
> >>
> >> The firmware is not different. However the signature on these images is
> >> different with each image having a different SWID. This is a limitation
> >> coming from TZ at this point. There is an FR93715 on TZ, to be able to use
> >> single signature for authentication. This is TBD on future targets from TZ i
> >> believe. Till that time for our QLI meta to load this image on available
> >> NSPs different copies needs to be there.
> >
> > What is the ETA for that? Will we fix it for the lemans targets?
> >
> > Having 2 pairs of images already was questionable. Having 4 exact images
> > is a definite overkill.
>
> I do not have an ETA. This FR is on a different team and definitely is
> an overkill even for our team, I think for SECA, the next target the TZ
> team might come up with a new authentication method

Please come back with the ETA. Alternatively, please start a
discussion on linux-arm-msm@ ML.

For now, having 4 exact images for the same platform is a NAK.

-- 
With best wishes
Dmitry
