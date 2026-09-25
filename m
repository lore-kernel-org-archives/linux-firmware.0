Return-Path: <SRS0=/V2O=HR=oss.qualcomm.com=thirusenthil.j@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EB8C9830E
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Sep 2026 08:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD0811F00893; Fri, 25 Sep 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790323607;
	b=THdU/WRi8Qx8DZr7jb2kY2wI5wc0LA2VID4nnMoZFabt+6AYL7Ghx+q7xy7QXJlB3Ky3
	 TaJrMOkJh776LwQCBiu3GPbDkw7UcXNLTBH0Rl//TAqce7bWA21nBdrZyrBEjajkfrL4D
	 21s70apXq7ySCY60RSAsFcfD4QyosmldlE4+Vugk4UbvDpkxUDDnSCVSd1XBtINbJpkdr
	 rOSi5gJEmw+RM73vF2q5G7H+AbgqVNSpj49QXss28jm5smIAa5KOn12Iw+5opiZM27hGB
	 9cJQfP6f1gMIGF78rkTRsKgQwZ0t9Yv5i2uO7wbeOntyA/MUZ+fZCPrnnUd7eo88mig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790323607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:List-Id:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=;
	b=rdvt5Wr6U7VaUZBahusfTrkcRCUpBZ3E9bCrGJHIWR1mp/t3HYvz5fRjtKYFfTJELmwu
	 kfyZY8iq2tFBWJ0jFZIXZpMULDvcivFuWz8eQnd++VDrRx6SmNN02UyC41K1vZxAeBPwk
	 r7Ey5m0CN3T9YBO3FdOx8ECu5jd7XGaI+RHcQcY6euIZBDFk4yNmiAz4XBozU/N81mVue
	 9yqC5pML2jcjDks4haXqgSl2kg3iwEqrQsRZbWIXTbkH7pni+mMaaJTfkN5EF3MxGUGGA
	 n6W9swMzWcM9Wq0UiTP9/kAHWTkIow47DgN0jQ2hh+wINpHllL7HEfJqs7pIJ0e3InQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXuCqkNN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cyg9TOjn;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F22E91F000FF
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 08:06:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXuCqkNN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cyg9TOjn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F22E91F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5In0U600190
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 08:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=; b=ZXuCqkNNFDQhRa1s
	rKRcpndxAJfUYdvmHqp9L4WiSxJ9KaPyYr4cPOOzlQ1vXQJPGB0IACXcHvKnQomp
	kLylC17M4UnuidpnDBRZvBsh79RV2BkU8srHQHHNDQ/ncpcozo+fmjGxpdJ0f8tL
	vcNZxbXmUuUf9G8qcu3OQA6jmlG9QThJ/37rPow4nukpD/VJPZmqs0j5M3Pf6Y6L
	f3Th0z6pnIRj68DFre9ZkoofV4FrQKvsSIUwXzE86+3Du/Du1nCsp5AQ7v49KApF
	5Ova5N5BRs+lr91C/eyk8pJdEcNYV12zcq344GxatFH/qkQDEtiuwGTurkJVUN4K
	eDB0uA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrf6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 08:06:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so2475878eec.1
        for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790323605; x=1790928405; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=;
        b=Cyg9TOjnS1Sbb0MHHSxMRz+xUVK1QjSpz3bVCqldG6+nml71jkPsqjRGeMVrX1pxSU
         Tm4pIR1ckCH4gExBjt0iNbB66rBRcmfVpTiajh86crBk4OuKQx3qVVGGuUNtK38GpHbT
         s3M3scZ0hWnjWy/ilZx/3QXoySRktVxpedyWSGY0+0p0A4kU+LsaMqklhn/b5HRdYSAc
         4xQ3qNdmk1WC/69iJVUAFJaKNgy9pJZLDG23s3NQ1LIHMOjuKHU8QR1SGu5GXtr/zEdB
         Es3fyCM3bKLV2fq8Nx/Dff8ND8MU4Zf8UqNWuXY5tCdrxiFWTwp12fmF0VeckTwRAflK
         XcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323605; x=1790928405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXdovoLJMD0EWFQVEeUyFuJNZbjj5H9sINMmw98Lt4Y=;
        b=JZQcPNMRmfXkgBtY9RkXfFiuf4hiaSN0Z2zilGMWjLJ7rl8eDdZePMNnYm9Fz/tpbS
         S0Z+Rr/wpDiH/FAX3IPZUNoJYrIscFtYDYDWM26xb9usVTdpPwdUAOEFIkN1oLF730/9
         V4oRjsyjnF4rFartS5f+r6vH3fd9UJ2iY3THYyz5gEUqFyO2Lws75MPo8Rtawh9ewpH8
         cHonAAFVpCaBWMZCkXb0NUk/gBMh61uXu1MUTsrAj+LktaVc0HNlj4fEVSXmKzgw28jL
         qRgGEE/Cl5ItS37WxhmUxNAs9oq7PyNYMqkUguRzm4FfLH6gzvg+8GaKI3vO0ydRylzP
         FL/w==
X-Forwarded-Encrypted: i=1; AKwUvBw1QOi/BAy+OJKrVyPLcfop6ZEFTY4lgUkvwZJrAYIFUlHoT+YjMsHVM7GMx8L29H0PPBvnpjr7pKhUAaBSjA==@kernel.org
X-Gm-Message-State: AFuF++l0mnKFjuxJq/uKHFbre3xYoAjyV7jQ4JSAJ9mdFnoUAl+X3C8Q
	3DQ7HYGYBk6j4Yl7xc7JUhLTUT7pjaSnPgg3GNPup5S48ucCSjBmGQV0zhM7GFXPiVr+TvA9seM
	CldOsgfkl9ESrv9Tm6lduCvGt+D5aj67b2YGPlF3gQeCrCZnwVMHxzC4Km59vz0Q=
X-Gm-Gg: AYBFou3CHmxhZHSKbwZqEfLlRz23RuNzNINiJ10PxyXLoA6GJr9R3E9i49uuUHf05VT
	SXw3koHhsv7SA06YMaXubwTuKiUQZjS43K97/flyFc1Pr6/qKAlNCAZnU7Q/i1WRMqR3yfm+EYt
	FhbMkqS6rtxp/m5VP1GfVJmR2xpvATVfkPju0imPMA3WpRWrOQ9hgNAIxVmT2rwuGyZW8FMAhnF
	1gLDF5XzTkNIXdwHRjKKVPo1eLoP2xf3jlvCckY1zMzVPhIwzABn940lPE0dcjSNUINeXm6fCJF
	zvjxQL/v1QfX1v4kMoxqepWV7OqF9Zd6VtQICLvlrbIjg7EYmAjPYD59YYkhbkqoc/fZjMVZd16
	HpvsuXY5fio6B/KYDH5llH3BRQ7C3zqNZwQ==
X-Received: by 2002:a05:7300:cb84:b0:33e:3f5b:3ffa with SMTP id 5a478bee46e88-3400162060dmr6068805eec.10.1790323604508;
        Fri, 25 Sep 2026 01:06:44 -0700 (PDT)
X-Received: by 2002:a05:7300:cb84:b0:33e:3f5b:3ffa with SMTP id 5a478bee46e88-3400162060dmr6068747eec.10.1790323603614;
        Fri, 25 Sep 2026 01:06:43 -0700 (PDT)
Received: from [10.152.202.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm4804246eec.1.2026.09.25.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:06:43 -0700 (PDT)
Message-ID: <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:36:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: inconsistent regdb for QCN9274
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: ath12k@lists.infradead.org, linux-firmware@kernel.org
References: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
Content-Language: en-US
From: Thirusenthil Kumaran J <thirusenthil.j@oss.qualcomm.com>
In-Reply-To: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ae00ALIPRw8NTQwJ3cZGeVbfQpVf4nbL
X-Proofpoint-ORIG-GUID: ae00ALIPRw8NTQwJ3cZGeVbfQpVf4nbL
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab62b95 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0H79OdPNVVR_eeETAwQA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX6ezo+WKYCgyF
 Ct3dMOm1htVvSkI8wLQu4vXQCcmm0L1OBTkoa1Ze9EbED5DWW0dRcL3XuhMnroS2qz+M/S3D/Xe
 f7hePOwl2OKaTcbtlWpG3SoOsnG7PTg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfXyX8lj0MMYXAA
 FFWL2o7g60B2s5gGjIcEBpt2ivpn216Z15ujwczYIsaeIpKj/vNaMZxpINFd3CE/emKouhZrOat
 8kHy14CzygK08KomkMcgIcoerRnohT8YoTt2OIrdl1rDatwodJEbOAv7QZWZ7Xzb4GG8l+b9hyU
 RCLCuUTy+yxqEePOPXDrilz02PT4KUHtdXpZIQpe55w8au16sUcRt2sjEPATCsdlQlIPViGsXRE
 /KHa0n6H7YbfJ1rzoURaNbRj5I9EknQZuGIv7XSt4ALVkWvpCTxpZxon0A+9ZqTNfqQtSl9AXof
 mnWO1IUjIcc4lqnAD6b3CUYqJ1YYUJmQgB4J3SxQCbKquwLEbW6Mzb9r32NiSxwuAWqnKGv7yn4
 eWFverWFzot9GeqoJ/9hSt5ZDafMfYoMU/subhDWQIB1k/GvMDfroCv8AYraQL9xxUbxFKZ/Suf
 nuQRXdOUA6do/yX+kog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250032

On 9/8/2026 12:16 PM, Alexander Wilhelm wrote:
> 
> Hello Developers,
> 
> I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
> can tell, the driver uses the regulatory database from the `board-2.bin` file.
> However, some country definitions do not appear to be fully implemented, as the
> values differ from those in Linux's standard `wireless-regdb` repository. I even
> downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
> related changes there.
> 
> For example, when switching to DE, I see the following values:
> * Channels 52-64: 23 dBm; I would expect 20.0 dBm
> * Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
> * Channels 144-173: (disabled); I would expect 13.0 dBm
> 
> US also appears to be inconsistent:
> * Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
> * Channels 169-173: (disabled); I would expect 30.0 dBm
> 
> I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
> example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
> is implicitly assumed that TPC is not supported. Therefore, some differences may
> be expected.
> 
> However, the values above still appear to be incorrect. Could someone at
> Qualcomm please investigate this and fix the regulatory information if it is
> indeed wrong? If the current behavior is intentional, I would appreciate an
> explanation of how these limits are derived, as they do not seem to match either
> the `wireless-regdb` entries or the applicable regulatory requirements. Thank
> you in advance.
> 
> 
> Best regards
> Alexander Wilhelm
> 

Hi Alexander,

Our internal regulatory team is reviewing the source and rationale for
these values. We would also like to confirm which BDF was selected on
your platform during boot.

Could you please share the following details from the affected platform?
- The exact platform/board model, or RDP number if applicable which is
used with the QCN9274.
- The complete dmesg output from the affected boot.

In particular, please include the ath12k QMI target-capability messages
containing information similar to:

chip_id, chip_family, board_id, soc_id, fw_version,

These messages are printed from the 'ath12k_qmi_request_target_cap()'
function. They will help us identify the chipset, board ID, SoC, and
firmware version, and correlate the selected BDF with the regulatory data.

For a quick filtered view, you may also run:

dmesg | grep -i -E 'ath12k|board|bdf|chip_id|fw_version|fw_build|soc_id'

With these details, we can verify whether the reported channels are
included in the selected BDF and continue investigating the regulatory
limits.

Best regards,
Thirusenthil
