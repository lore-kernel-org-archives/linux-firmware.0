Return-Path: <SRS0=bkY5=GY=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B672C624C9
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 12:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 137331F000E9; Mon, 31 Aug 2026 12:33:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788179634;
	b=SCjDeOy9WGNyKdIvLhMLIYMyLjWt/A1o5QisyWU0m9rE8QkmPVPQhFKFvomjexvZpadi
	 i2J/Bji1K3+bHcx2Y6zQ1Kf0Q0MMcFadfEN6f0EqiB/s/gOgG26XrBVTFpL9VC14as5d1
	 t4mWNxbeYaqGNTXQUTBiDeD4i5LstxAmaasWa+94YzOOACaqLcfVn5cs2TyqsHVP4Cd2c
	 C+ilbD5J8IbaAb5X1GHv/p4a8D2CrIraBI8CXZjEyEQYNrMMOUAs5/Icl5OKWltOLdk9I
	 KxRovYHeNXEcSZbPAYnzkN/CRwN/jsc05S6eUmwvsciA/vEZV/NI8HoFYjRGzu3oRpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788179634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7vonnX2x3VGBAgKSGFgx0409x3dd8Geey+/qzCI9edo=;
	b=wSCquHX59xLclS18gWwk+w6PwbxX50myDwrzPT96oU431gWIo99Bj/CIl9HTOC4e+IX1
	 UgcdmJFIULSCwq8d7jdXwsbywJ6DwTX/75eVfYSwrJZlJcnIdMpIdz9UkvGEhWjqMjya/
	 bkK1/OFkeYGhpKNkFhR0QioQLPi5f/Q22Zhz2JZg8/Z9XGb/RnFhQq+4FFpib5flbukEt
	 WtDPgW+l8mXVon0iIVeLKy77ajG3fFJQH8HJOSw0unolGEO4Pp87wF8oI0pcc8vNKXszO
	 48Gwktt6+1emN94jcP4/poXn4FeEBV3bki+qzSwvzw6ABD5fpeQvdgnOPUmum0jThDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ur/8YRjV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atQJZtSH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FEC91F00A3D
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:33:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ur/8YRjV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atQJZtSH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6FEC91F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA6iH3448534
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7vonnX2x3VGBAgKSGFgx0409
	x3dd8Geey+/qzCI9edo=; b=Ur/8YRjVSIVfQOHL2EzVxUoFRra+4ANsSUfTXfSa
	PFLPlxMdKoTOIz36TkNFYieWJTB1+WNmSWcts6rGSLNaHkCA5PdrPiV/wZmU3Ft7
	w+8bsUXwkFIZ9c82/3xeoLAHVaqY1gmmOSVwC9k9t1Q5K2GMdsOyVRS+MaKWTR/t
	51uWxRUoHf7XrEPs+U9N8j0juwHAyXmMIIgKYJLTpzx8ATORp7gG2Vz+x/QSjwpg
	9+sNRvRiSMYMj1xa5jJWKbBf36uSdj7YkTHeqPF/9eq3dn4N65FwDW1AIJs52sqs
	C/CfilQntIlM1/+MNd5e9Nd8VsKmUmnAAMaxicgBx/cZ/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb8rkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:33:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c5a97821b9so4902584e0c.3
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 05:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788179631; x=1788784431; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vonnX2x3VGBAgKSGFgx0409x3dd8Geey+/qzCI9edo=;
        b=atQJZtSHlrsmJzZAzZva24KhTBSu2LJMUZHxR/xUudk0QYkdZVA6ZBuS8cJGECGHmp
         xkeySW2Nm2j7XUbWG9O8mQa2xinGaRaKy+4c8EQZGPV1wgcW7oSi2RGmGisW9vq15nWE
         aJCtabuDwIdmbgWwKvw3h/BXRFPjCALK++o7mtdonyi9dEwGVVGlBBMFgGttw5nQDgmx
         ka5A2tq8WGdfW0Metd/GyUXmrJG/wNHfKUqp7gCybPhZ49yoS3g/o08HE9EEkpgGXe15
         bHQR1h0jh+OGYJFXjz+v8Q+NEoTnrX9+3Xamr+tHd8cL1RYV+8MlcohD3pEqeo4hSEfI
         s4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179631; x=1788784431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vonnX2x3VGBAgKSGFgx0409x3dd8Geey+/qzCI9edo=;
        b=VPeP8qGMasoJnkuUGAkW8Tc+yCr/CzpMn7ZmE77wZLpsQ3Zj6W0NWNPHoFoZ99jIoa
         OILzGcv2aONrpCbFoMl6i6q2r/UwJE4AjyzbKW46JBc4quAvWiLWgvfuqxucpennBj3d
         KgW14B/M95EZlaNYWyZXyOeniwVCBIalN4d9Eq3lexNhjB9TTcgUYIusBkrckvUHsAZW
         K45o6NzbNvCDd7+nEOFDG9pKVG64Lf4hnIS32APN20+tnnXqGs/TuWBjO/i6KiahtNvZ
         wquDqKzul9U15kglaE6wSqUL2atPTfFplLT9sUBzNv6+Iki3oJitIoB45lMQr1RorlkV
         qZtA==
X-Gm-Message-State: AFuF++kGE1ad8oQ1U3/T7ufQMlU7kKh5mqs7cX8SsvSMcU2qp1+HjM3Z
	Ci1rkj7XXrF1NmtnJgLTTVH2yFebsZXzt46lnjwK5+jKt4AfL2Js3mNHd1NWKO7fZYpalTucF1f
	E4HrzumeOQMUt9B4CF8xNebXM9wa67ztLtDEe2ohQfx/yKUYIXUxNA9pWzRKy+1NKek7B7pA=
X-Gm-Gg: AR+sD13bdx2XwfixwCK0+pyGXxHkseorHc8oVqcoCjY6aU/QPshyP3rRO5WrNWAHVmw
	akhCE+rOmtdTGATqK6KyaTrk6DHQbc0AsNaYUxbvk1kvf53bj5Vq0MlGejdQtTQG/Ce9i3S7pTZ
	F52qyBs7TxW5z/jI1a0nL6lbtUfOtig8Ue8A4DMxscmUYMiWV4QNBbrh5k5+eva+8uHBH1yKpEn
	jrvs8d8v1LyFuI0TrG6gB0QC2kNBAiDqfPCrGU02lMJ2KVLDsL3gqnnUfPmj5ddDxY7xyeT2dxH
	v03aWTs2LWn7JJ0xZ2E7Oj64cBnBTMqDQWaIDthdBhsUAP2cosas8vhWx1Ajyog/Tj0JKlh3LFx
	Nl3zOwpZolDLfIbqxbAW7Bs9lbEOKjnGTFYXnitMvXjASkqKwePND88fva6osCnrXrfXgEOzbQs
	jri5WTEYmeGDwm
X-Received: by 2002:a05:6122:8cf:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7bdf956dfmr266935e0c.3.1788179631355;
        Mon, 31 Aug 2026 05:33:51 -0700 (PDT)
X-Received: by 2002:a05:6122:8cf:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7bdf956dfmr266923e0c.3.1788179630961;
        Mon, 31 Aug 2026 05:33:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm15628271fa.9.2026.08.31.05.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:33:49 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:33:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: add ADSP2 firmware for nord platform
Message-ID: <xtiujal7w3ydojjcloqunfhvei33i7gpnxzv5ae54qms2nvdlq@4dzxi2u2frik>
References: <10a44e53-3531-4160-9782-f7d62f7efb6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a44e53-3531-4160-9782-f7d62f7efb6a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: r7elslIZd_OuwnyPpSXDIbqlGv-wBQF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwOCBTYWx0ZWRfXzoydLjjdo0oZ
 a55utNbvtl4u1Q5ph/7dke3kxAh2TI6/S/w/nZLlzVuJcz8Nqdkkur5W2SiwHVlkvPyOY/PwVW6
 wxHlAsNsbHqniiaILvtaiZz3ZMaaNH68QI8S9U3HFpEQQNrnA1YHU76px+pxeQVM+y9N9klTsQS
 8Ua1Sxl/ty/Zt4Qd1L6VVRgbNYtkbRGmhMll31+QJQJTUimDxLJFBwNDMJeQGBhpSVD0Rz6mY9F
 Grry/j+4yZoVt3JO2A/VZgQnXz9mAvSig8ZqfhSu7lTNyAJ1pmLAakuNmwTn9jw0HEiWrDGlXRO
 KQsBkM5LzLhCjC9oGa/fUACwJlsmQloLicHnf4VOJ/0Yw/TU/OkPCxtmZ1ynoBzG7oCZhLCC/qK
 VzrOEOpUye1AHgbnnPdAevLafqIYMH5nJCxogbJ0UADWlMMtBCgXV/dVMrQG5i95legb47wtc8Y
 PtRRg0nChZy8mLvuQhA==
X-Proofpoint-GUID: r7elslIZd_OuwnyPpSXDIbqlGv-wBQF1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwOCBTYWx0ZWRfX7NtwjqDyNxx/
 mQhueqb8X5r0BeHbfv7Y1LqN8oPkK1LLc9rXqF8BAY5knUPQsDATFSl5MSCHOlTP1wEBoumOq6C
 AEt7t9ZFjd4vt39fhpNoZ9S81BedZFQ=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a9574b0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=DLIE7fLVdX1sycj-nLMA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310108

On Mon, Aug 31, 2026 at 04:00:15PM +0530, Venkata Kota wrote:
> The following changes since commit 458e40fdbb4dad5134ec230a42df21aea1b5baf8:
> 
>   Merge branch 'amd-staging' into 'main' (2026-08-29 13:09:19 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-nordadsp2
> 
> for you to fetch changes up to 93681b24b15639f4e56102f82da073f0bf63fcfa:
> 
>   qcom: add ADSP2 firmware for nord platform (2026-08-31 15:51:54 +0530)

What has changed since the previous submission? It's still a separate
firmware image and commit message which explains nothing.

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: add ADSP2 firmware for nord platform

Please take a look at the DCO documentation. You are submitting a patch,
created by another developer.

-- 
With best wishes
Dmitry
