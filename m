Return-Path: <SRS0=l/g5=GZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5D1C61DD3
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 11:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D4E01F000E9; Tue,  1 Sep 2026 11:07:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788260847;
	b=RJBAdK9KQCnolkG4JPIlNmBDCq2gNF8J0QAbR1x2JMSotVowQVfkaLr2dUTNmxCxoXJ2
	 vHR1GvaIdTPuGOC/oHwgyENxZsDzsWyIKMRqou99CM4CSg43DzabUIWSS3F5jixM09Vx6
	 EI3XgQ64yqxNbwZ+bdhSaIuKIrfcCMDOOGwFZS0P1+gKap3CzmJoIsGRqYeiDOkJviZ+S
	 zfikILaeyavyBXeoWyrPZ32KbOXUWKKnZKZ7fJLXaYfkDkn9jPoNtNkR1c1jgl/ckuDZm
	 QyIc81h8BsPCmpo41RpRHqcqZI0U663Nhiy4ahvMMiUDmXk4zoZNFj3qEMAv+mcimdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788260847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+ZNN5ArlJ6q3vCynJwkLmhIdYYN+1Id+zikdMxd8c2k=;
	b=xbk9jJ5x859PJnBNoupbv9NIDvzRkwWo8jpikv+tAvi6dLkfmfRRUkyt0jlE9N5Xdz4G
	 OuulIyKgCXeqjvyoevnd10GFA2mepWCRBtttpYbGFTI4ImX77QuRnuRMRI2HAc+kKH/8r
	 Ux/dezxWOWwnJqPDF1joBQ5F48bYZhjNT+ZrPJHtYcH68zi8eILeTKgay9QK3+eprRjI0
	 w0MyUl9Fs3JnFvKFXiUNRBsOqIZivBpmiKLPhqD4FtPtOaoSlFm8gxpV4gI12z2TC1bH6
	 z7TrDZA29l6DFmuKSjtIkotgQPFaYrYUavkg5uhjTJd0GB3Ddn/hXQfeKKRfacDt7Rg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Af5PQ45p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hpoPfwFZ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D19C1F00A3E
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Af5PQ45p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hpoPfwFZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8D19C1F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ9gH1641292
	for <linux-firmware@kernel.org>; Tue, 1 Sep 2026 11:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ZNN5ArlJ6q3vCynJwkLmhId
	YYN+1Id+zikdMxd8c2k=; b=Af5PQ45pdmL4LrJVUIWVwLHOiATnmv+tuj5VqxHK
	4FknBPIgYlPMAVdWuVvOpLJiUBX7IC3HY/uOczPll15DyfIfrTTw94VhHsGDtNQR
	miaZZHRS+Z5EGXtf+N3T8KmrI+l9BVo9b4S1dCwgG8Q83Y0sIyr9kJe9+U1tQ+nI
	fIG1a+KdnggQnVqtxgAQNopQOy5y+8w5QdjwHofc5yyc7NQuVCFsg1XkXMMtRAd2
	fcs7z8ZthkxnUGdl9leiifcJCReVSEicqcOcrYN+LYwDTvhm+bfnMU2sHUIqJj7c
	vqB530Wyw7cnhXaBiycCdfLoHo7xvyFx+Dom86SGS/sqAA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8t8w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 11:07:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738627c7908so980728137.2
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788260845; x=1788865645; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZNN5ArlJ6q3vCynJwkLmhIdYYN+1Id+zikdMxd8c2k=;
        b=hpoPfwFZBrtcxZ0Uz1+iPrbpjTbkXq/iorZpffa2imKZcYk00TwdF6EtPh0ML8N245
         bBbJfeSvYd6T7h88y1c4rvTzoE0aLnzJQ5EpBchfkS1sT/ocZH3869xn3LyZVx4Ey26w
         xfsmB7O6BqkhGY/cV7sVPcPPNGum6+1/aF6Zb84z9RaBBbwn7RVZgsQrSVMXo+K5/JmO
         v05O+5MCuAxX1r4OohFWUGo+o6zXIh+YXY3Lf6shpd14YVQyOeh7AsM3EIJcJtPWRiqL
         d98Yw2UIqSaBM2Htsy+qEGcE7u5Tdsrs+ZcuQt5KkmTLMz/MXBipnrUlvN3cCa99xeSz
         MiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260845; x=1788865645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZNN5ArlJ6q3vCynJwkLmhIdYYN+1Id+zikdMxd8c2k=;
        b=TKRtAiOvFIJtrLlOq9rS/0IA9/U2lgyNiA+RdTbZ1auzQexL5WfGupxo2N0YLX9pP2
         zeV1Ln9xg2kkyyTHNyWqz7HFzafzsEiass5XZczrv4UPplVSpK8G5XXqhF6yWQDiAuo0
         8qQJT3D7v0zMYI2grnxNRt4Y/guc4KmxnrYlL+UFZVBIR128eHU8Oz7DNDDBD2M7zv43
         TGw038lGEVtlbRAkG8qJ7y292g9vDEnGmH6bEBVTcU6FKeLMBn0mtUcvaQkpstcDp4sx
         bEUocRxmmyEvjlfbTbCgKBYQPNDUHoxgyzV1qPc+doRec0y82cDJUws9s/O4LE6ceMAG
         Lc1w==
X-Gm-Message-State: AFuF++ndarus49rz1rY6plZqBVKrF9e6ybRHMj/6Zbqnv+lMbdalH5BJ
	yDwtz3SrOPR4PS6BP9unxPsJ+HDbStWQIexZBm6dhoJmKzZU4v29DIMsqdfc4tjo8Wma6DJTdv3
	FKYjLyQ9jVmYZ1ppmdTgZVZMwgAKfYrpvzS55htlgp5kTODgCW/UlcwGjXHURAi0=
X-Gm-Gg: AR+sD11X1ljDQ3UdvDbfxFhsWfibjmZ9m8lUp7jUZqHTuQzeJ2vD8eZ2uEptVgLqC+4
	cwDR74ZzI3g9p/oRrKR8vSGdTqL7zU1FMxWY4R/OFnsCiUMxvI5sg1BNqrLEw8k9ypJHuHfWO97
	HegZsIHHHQnijxGfbEiDMeiV3R6nwUWyezIPMG4EVWzXmS4HjuJmlnVUFDJNArkGQ1pRhkCY3pw
	C9Iz+feYOut9kfhypKSiJ8tm8p0lzvj/F3+xuBjX8JouhPY9AX9YXe+8KVp8uiXvvnYaaHQT2Us
	6+BKxoTT6eq8CVR3Qaon1fHc5XnSrn54O+qJuY/MuvZSbxnSvfaw+CpM89jy1hQrWkOdi/6hDQV
	w0z0pPUNNtqDm99Y0soNcqXf3ZAwC4eXo0Rm/pDr10761Zh7y09/wbwKVBUKQZpNBeL9YSfX/GN
	hKsgrL9dIlzGdS
X-Received: by 2002:a05:6102:5547:b0:789:100e:3d1b with SMTP id ada2fe7eead31-789fbd83af3mr2549024137.0.1788260844622;
        Tue, 01 Sep 2026 04:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5547:b0:789:100e:3d1b with SMTP id ada2fe7eead31-789fbd83af3mr2549012137.0.1788260844094;
        Tue, 01 Sep 2026 04:07:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b34sm2771978e87.3.2026.09.01.04.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:07:22 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:07:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: add ADSP2 firmware for nord platform
Message-ID: <o3dwuzj2f3lgffpktrm3kw7adt6k2pkhogwwfdtvbjpc27myfp@fogpzasmcrgj>
References: <993dc3d9-85fa-4861-b9f8-3db807c0b3be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <993dc3d9-85fa-4861-b9f8-3db807c0b3be@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96b1ed cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=HXIJMFhTq73PJ_VQD9YA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OCBTYWx0ZWRfX62VuAuo5P6/y
 EAnEPGMCcI6pkQqi1Wpy0RYTzzd2EZXJNzzMf3C8CjMHF2HlfCJEBgSWo+Pgd7RRCHmMRSXRtGH
 mGJHaqsTXmuZVndHV1zzqdtVYefE7xsGAkzJXg/s2IBm4u3N24mPP2/OstEBmgp9V/vBejoeNIz
 npFXZNEYuJXQl6mv906s4yZunHlcy3oq8H7Hdi+GYbcLMh+8igZA3sY5tKddQOsWIbbz+RV88dw
 /UBYjEoeYtCtVFNlqb4D/vzX+FWQsCsPZB98LvmlbrVfeSSAUVEk64BZdfDgD2BR4vRz2zwLIR7
 txS4PoWTmtLsZ706qUeQV/Wn1AoyaXqGwPWo4kqIBgRnsx08deV9zH5fcaE2jrUi4Vsjmt0hnXd
 h0DuDvNJ22kS715lnKwSjVXCMD/kSr0AMkfYyL0lXWxnNyBnKGWza6omaANRxK9wCSAcN10H7qZ
 spdnx91vyb29dmnX+Gg==
X-Proofpoint-ORIG-GUID: W8xbZ-8s7Oeot32kVWYwlUAs_9B-i1jS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OCBTYWx0ZWRfX3L2Gi0vA1RGV
 FaGBvKtrnhR5xAUxDDLSSlg+G7oONSNVcz1HehykXpkQG99fwj0Rp8xCQGdJg3SA7GZuSZPr+7H
 8ThOj90OODd0J8IkUxGGwijgXq7B08Y=
X-Proofpoint-GUID: W8xbZ-8s7Oeot32kVWYwlUAs_9B-i1jS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010098

On Tue, Sep 01, 2026 at 11:14:48AM +0530, Saddam Patan wrote:
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-adspnord2
> 
> for you to fetch changes up to c6bed7b5dc85b213bfa40e9032a42cf02595549d:
> 
>   qcom: add ADSP2 firmware for nord platform (2026-09-01 11:11:54 +0530)

From you commit message:

ADSP2 shares common QuRT and platform configuration with ADSP1,
but requires instance-specific settings, including separate L2/DMT
and HWIO configuration inputs, different TCSR SKU masks, distinct
SRM/ETM/L2 register windows, and different physical memory pool
bases. Reusing a single image across both DSP instances can result
in incorrect register programming or physical memory mapping.

So, why all those settings can't go to the adsp_dtb ?


> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: add ADSP2 firmware for nord platform
> 
>  WHENCE                  |   3 +++
>  qcom/nord/adsp2.mbn     | Bin 0 -> 3363776 bytes
>  qcom/nord/adsp2_dtb.mbn | Bin 0 -> 40960 bytes
>  qcom/nord/adsp2r.jsn    |  22 ++++++++++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 qcom/nord/adsp2.mbn
>  create mode 100644 qcom/nord/adsp2_dtb.mbn
>  create mode 100644 qcom/nord/adsp2r.jsn

-- 
With best wishes
Dmitry
