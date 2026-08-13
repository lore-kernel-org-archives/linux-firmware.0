Return-Path: <SRS0=B8UX=GG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CA8C5B572
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDACE1F00AC4; Thu, 13 Aug 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786616700;
	b=q1GJV5LIL0f1hssflteLxsSTs/2zGF822iKQPV8GHJXx1+rY9tQpM7W/ImHFDyD0U0w1
	 KZiZez1nr8DAfkiePlv7bUXktbSE1IeT6DQAuD9gH2G5eMT+fcufSNztUPRuznnzMSNtk
	 BZ4Xuk6/9N6r3t3hBTj5BjVV79P4kQ8mODWir7dWiXOM21z9LX9liRAqqzCVmtQEcIycP
	 RCVAdeP8z3SDBrqBw7yJetPzKxw+qzfi2OIOgdtxafeT1KYQjGWcdPdRWWVpnyIuxo7Dr
	 BhVBMIO1lbubdUqQeKonB5WRG+wXzA4ugzv6d6JF6CVFRZzV5w2ZnDMXv402diWpCbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786616700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gqL6eAm1WscEJEJk8CxwHfRLhq1EDrlsvm/inA8fYbc=;
	b=kduwfJRuI8oVuLV4CsSkZuJuH/DozP1FoZk1GlFIBTwmb07oFyN6AUkvR+7vqFvmzKzh
	 rDR5QxtAB2Gcxy0wtzvIJAPSAycbIm/L/ppFeGeNRcyC9xSSnUST5iT6pM11jq/QxgL70
	 R8eJeFtLi4I2NTUor0cf2msTrk6+iPR3Zr5AHBnpTWleZAqIsCVczmDHteUC9gSKJie+I
	 fdIT/AFgfyo6/tjkFRtGCdSDeestBd0rFDWUYZkclYaLzzWsapX2iBd0cotFHBHCOBfkB
	 oWZDjC7YLapQiKegP2Aq2Gszm5H6UhWZUVJQuwBAyVMG1duRXEI572fCCv7SfV0dxHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n68vZK4r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ej0pAf/g";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 363981F00A3F
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n68vZK4r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ej0pAf/g
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 363981F00A3F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D934ps2326106
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqL6eAm1WscEJEJk8CxwHfRLhq1EDrlsvm/inA8fYbc=; b=n68vZK4rk290ebIS
	YueWa8ozF7i39yRXXbBiW+CKbT8wsW+d5oO7SuXjoLN2DvI1jaQQYWxK8wiS36ff
	aR+74wz8/2LJnYutrOsMIA3TPArbmCBhy0SdSuu90P8jdYLGJ/mQmrzMzkIByOzH
	64d48C32V/a3iQvBJ82ALUD2Lz5NBmsLM8opDfTOE5WtmE3iE7fDLfLidgPaERII
	CCfpY/ZaQAKDp3h1bFn7qVkXTCb80sOC7XM1KLpAFXzfH4Q8Wp8YtrL5qGsRQXVI
	1owap73T0hZgQnuGD0mimaJQwSD4qsZFdvULcagdVZ/cUdD0Qnba11tJlbqYkcLd
	jDfueQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8uhpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:24:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so28771805ad.1
        for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786616699; x=1787221499; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqL6eAm1WscEJEJk8CxwHfRLhq1EDrlsvm/inA8fYbc=;
        b=Ej0pAf/gF3qJrXq8trbGgyqO1uIwYKD/M6dl2n0D2j37go58XZU/SMvD9Vi0u1XJbj
         L514OCqiPaSv1XNNI/KeQqBdxfZA3MP0mlmVXP0qUYZEn1jM5iWzQEDZXfbd3ZSH3hVq
         mLco6Y939q5kyUyv1d6/Ghbo59lncC2RWeHD+QcaLCbvVGFN50IdYQNOPKUI1BrbYXUj
         8amf8Z/XUbXzrzqkZMAclnFMvSox6TmbsP7MmaeI7JW7ciKcLkohiBWbZ62OFiQMJgcu
         vVDhnuneEXk/qw0ASm+bYynLoxLi6nUUcXaVHAn1hrhOFBtEuB3HDO2ZVyrgGQsRPCPv
         RoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616699; x=1787221499;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqL6eAm1WscEJEJk8CxwHfRLhq1EDrlsvm/inA8fYbc=;
        b=WEwhDhXf5uadooofjc2pdGfYyL/zgPdqereFJOO7BeHTNWJHdwbYMfHnc3VnwCie6H
         3DZwX39EB2+6K4SQMh/oLIEvx5OhVlJrZqDqegAZGwTNk2E2usf9msU1qlliGiGorZgH
         bsls1kOeykLMMR7w6kt6nwJ3XrjkNm0GMd/FsGFdE+LABiLdadfhroodiQT1jwzPUnb4
         Ucej9AhEooQjkN01tSCaHxbAYAmYyICK/Fb9joVbKRr8iRG6FZZe2r6NXC4H1QKQK2fl
         1ypfWBO0RCx5EUyf4ep2pTcKqnG1WxX9GnITEYKXWE3Rgm7SoxR1slKSrjKDS/QAbpEW
         VqYw==
X-Gm-Message-State: AOJu0YxpqvnTnhAlk8QuK7wpICVEJ74gDeDpxYjcqJcGZsq2tYxZpene
	2ZCqDMvXjnRJdafY1q5RJyWTHMbKkBlupnBoDzQcWxeD6QJNIKMf67Rg7VxhJ6uw5o+V8YkmOcN
	5jhuWNiMvvC2/z4t/nNoMkVaOry8YqGIOxH3lA8BSi/tK5iYOY6VMilzraqyW8XY=
X-Gm-Gg: AR+sD11Rf+VvfNhM6yU4eR7so5xz9EmWc8XqT6Glu0BDkdgex6B1G41o1pXoJXZ4z+N
	/zuvJ8xvlPaEB511bCfB9uf3ZCTh1gZjGAAlADlFIXyI+7u5uWane+fMNThnRisXysD/9nXWbMp
	ZJ5VxItV6+As3LxU1bhzxMjGgQ4FhJNpjBK+y31Epaxq56qN8Ri6TLrkSWOoQtsFtKamnilbLCU
	jdFmSi+QE1w1/F4PtJP83SDhDgRKGA+wWyjm+ybnd80vUxfyGSbWpn27Z5IhmWvEu2h9yZA25SE
	gPJPDBpCK+JN7B0xLX7+5SL+ldNShTRpcfyEf+Em/skQcZP0mgYi6Ow5FDIeUYcJkBHbtiyHhRA
	kLNB5V93QjCNKPdoiwrH4t1s1Om6y
X-Received: by 2002:a17:903:1ac4:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2d37d1ca9e3mr58351685ad.0.1786616698573;
        Thu, 13 Aug 2026 03:24:58 -0700 (PDT)
X-Received: by 2002:a17:903:1ac4:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2d37d1ca9e3mr58351195ad.0.1786616698095;
        Thu, 13 Aug 2026 03:24:58 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c2001a6sm7199175ad.17.2026.08.13.03.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 03:24:57 -0700 (PDT)
Message-ID: <a5542bce-d4f6-42df-8f4b-45a79e86b693@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:54:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add NSP firmware for nords platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
 <ymrmbgzvxmr6gkldjlg4d6iybqw52gi56t4clffooxoxhgjvyq@l24a5b4viu2u>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <ymrmbgzvxmr6gkldjlg4d6iybqw52gi56t4clffooxoxhgjvyq@l24a5b4viu2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7d9b7b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=lotTsLPAsqKGJ6c-HuIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3MiBTYWx0ZWRfX9Ps7NDDf0Mi5
 RhKi0GAdZz9PeFGLqT7z4mcSgmRwy/bJY+sZ+UTNujR4qxSUle8tqac5KQk2+YtapLe5cnlyM+6
 asA5GMYYhIjBOuvhEC16TsdvMwa9Mm1FBfdl3bsDQ967k6oNbuay98KtvOrJb/YF0Z+PW1DMLbK
 /dJBo00iXt16vyINeiY125UffLjZ9f2TsBAbdqlVsEiamumRSg9KRKBpbNbmOFgmPe7COc9Lylu
 cYoCztzJ9XLyCFb3ybsl4xNSMPiC8QzJywKu5rZZBpX1o1KxMqGS+P4pxK+Wh8OHlq0YX2fYDpG
 watJthqXj7bgPe1w+NPZlD3t8EyPjm2Q/I8cpnQVvIhSp1Vse4EtwROOwhFQfxWBcA70fmBi/8c
 Os5mCFCvUn4JGsfjJdz2/WKVbzQPESE28rxU0sbfp2GyB4nvZLVap74gU2fv9NawfgAwNTOwSWi
 A9wmYR/uo36uvAduThg==
X-Proofpoint-ORIG-GUID: B41Zchz3yJ84_H1o3XdgCQhfjNtcVIF9
X-Proofpoint-GUID: B41Zchz3yJ84_H1o3XdgCQhfjNtcVIF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3MiBTYWx0ZWRfXwBjT5DAUfPLZ
 ke/JDZbBfl3NTbH0qRXMX8S9zPhj055k5EZvZypNsDijz0mDRlLBxLJ8WNXvaLr3EoWLrQNy4kK
 Ihdf0AaXDI6SgyYMVHYFw+I8LBwCLss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130072



On 8/13/2026 3:51 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
>> The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
>>
>>    Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-nordsnsp
>>
>> for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
>>
>>    qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: add NSP firmware for nords platform
>>
>>   WHENCE                   |  13 +++++++++++++
>>   qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes
> 
> Also, from the DT patches I see "qcom/nord" being used. Why do you
> submit to "qcom/nords"?

I was given the information as qcom/nords by the team. Before creating 
the folder in the git. Will check on that clean it up
> 
>>   qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes
> 

