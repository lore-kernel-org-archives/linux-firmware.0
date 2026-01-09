Return-Path: <SRS0=hVQZ=7O=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10107D1A605
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 12:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5029C16AAE; Fri,  9 Jan 2026 12:21:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F213C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 12:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F213C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XWK1823026
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 12:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rh1BcaCOF1cp2lNPNo3xstbXh/AXwX70H8TfVA2thfU=; b=dNwFEONNcUeeb7Gc
	oy/UeDJNRnPyM7941bqsYcylRfSshEpPX7w/O86qq+CMqhxHtINfaEe5ByhBNwjV
	805+I6sNKcpMNyLVNjtytSkLHLSVTPGrUiLEu6Zvwnl8r/2DIrnLuBClvYu92qVK
	xLtJZ8s/2kpmFaKJ/C2gm47Dc/WwF7dkQ9B5/1DQ5qCl1CWg4P+RKm3LFpIFP8zp
	wROzOsURawxcVkL5DiAo2ZxB2eWOlMgDB4ALnvnSH6smpZNlqO4RP9ffwfcgZiD8
	lVaWeCT4mJxBV2GjaX597KSzb7iKlNW0j/QVFMPEpsh4uyyCp97xnet1zuAfexIT
	u1Gxag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94gpbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 12:21:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c21341f56so8726975a91.2
        for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 04:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767961274; x=1768566074; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh1BcaCOF1cp2lNPNo3xstbXh/AXwX70H8TfVA2thfU=;
        b=X/1UdF53oenF2E7O5KHX7TjhjYKYgahOeF7iSpvNCID3B33YCtA96CbRk0DZvEpIiS
         UaqnII84yfhR1zIIvziibxvzyCmvuLtADzHhpAvjeFSoAaZDpp0wfNvegrkUF3whQXUJ
         lMluxjxJL7muQQhbjZrOnHSHVSEB25gChRI01z8p1/3Tw3jh4CiIUqxmCfVteK9Vri0X
         ydjyj5WR6gIB+XaVCHImKuXZv9DaQZPQ2H1eBGF/GYkI+zJmw+4IMZ/jAZxu+mXDfaU0
         L0Jf1U7kOkfzRMKEL6lFusqmUF1TYzv9t54+LnYl9gQMYpNktS+LvAJ+t8sciSdSmOk1
         khKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767961274; x=1768566074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh1BcaCOF1cp2lNPNo3xstbXh/AXwX70H8TfVA2thfU=;
        b=VpqElMTqv0uQWaGNPMeOxysx/vKL8iSo2ZSAEwdvp/09SwvSNrMyM08Sabr27VlHmg
         iyr8Da0K/4HSzLvoASUdOHsceaZ1Bitdgnx9wyU2eYKLZ0ny26TJ3xQJjezKieX2yK8W
         QDzGHrj8ojjwXdGWCPPgAVYgFsHg4VePeDmvamiQNOOxnGpX6fPvvioKAVIo7yXJXS1D
         usUJrlEo6bZ9qe9ACjBf4B/b8/JZ6MVFHvc5PPoqmkH6UDBxul1Qi+wgkpqSfrvkeUSU
         QSYLiJFHWvDaIWHDpWgkCbAGI+6yt0C/4LeDPRupfOw0ogQcByLALrsfmcBhb5QFLqKa
         Np4Q==
X-Gm-Message-State: AOJu0Yx18XkosKa/FZwsOaiN+YgiQcsL9PobMRGNPwEnlcDq2Ek2IYW5
	Bs+U6aQjhwSge9+hxheYq6lLp8cDPQLyM1bF7VXDbZ3H5ks/sGwEKpFAQotA8SUo7mMsrXpdIla
	3jxJQafeMENmOTYGOLJXAiq+7m+CwGzV78pHqKOyou91VMBkfRxLlTvPeN50yAUhYpxcHw0M=
X-Gm-Gg: AY/fxX76DMKWX8foxQDUprdDgHCZwdQGQ44enB/1piV9vewwvwEBwQ87CYHB+2VUC0+
	PWUxjroYutINKUIWizqWR30mx7jsmS1Qn5tC7/ZVqHlWWZ14WWGcXBCAzP8z6evpFBDo4SWxgmY
	6U0sUtmOSLNzcZPfwxf0xh1kHh3HoUHyZmO2M3b7sH7ifLNfRfAxaTboMzuao681YHhC8kR2/ep
	gebtQytCeLHD/F5Z6TTJq5uhWYQ8cYdx5jYvdkzAlCv4GDCfYuHGOC7pFRiongcurCPPHB6G/VX
	PO6FwaKIvw3/jzR4kpzS3CRmyaNJp74PNDjP9gSlqVLg8A+yOJltWbftj5GqeZVZayVnZLIOZnU
	yeI4kbqOuJw/18bHLSHDlZ6Hg3+l55h1M9vQU6AI=
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-34f68c308camr10177675a91.6.1767961273624;
        Fri, 09 Jan 2026 04:21:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUlvxn7r1STB52PcLuN7/IdtOZWIJgS6gKN3Paja/IgyYxL5oQBxCHuU1cwOPz6B3uT2/lmw==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-34f68c308camr10177652a91.6.1767961273078;
        Fri, 09 Jan 2026 04:21:13 -0800 (PST)
Received: from [10.216.59.102] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6af48a75sm2906861a91.1.2026.01.09.04.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 04:21:12 -0800 (PST)
Message-ID: <46938a22-9e10-424e-aeb8-c14726f96fcf@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 17:51:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
References: <62282860-1319-4d71-b917-51a51f37d75d@oss.qualcomm.com>
 <lommxush223zqhanhyewajaf3lrnaw2gp2sbtp2nsl7stlz2f5@y6eqahqtmlm7>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <lommxush223zqhanhyewajaf3lrnaw2gp2sbtp2nsl7stlz2f5@y6eqahqtmlm7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=6960f2ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=1pckcY8huXtYohY0bcoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: HxG4bdBbub5i7X-TPY3Y06NqAN1IUtZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5MSBTYWx0ZWRfX4Op68Yt1BgUz
 2IZ+Ss+JOlBjZMEgsJTGx+pMvbwH309hqFw1kz8O4VpBYlwmtKWxLFaHsKDZ2yp9ECWyL6fR2tw
 YMCIp/VUWkEXdnPdLtBoQYYNbVcQbfTm3KhGnsCUjGuvA7fEFFzxL0eZcWPex/NPvQEEFD/sn9i
 jpJ+GvD7/vKIjhevAzUwJL+aLIL/9iMV2rrorUuKdUb57INrfBHTNGu5AeUDhNkXrePsbybVXbZ
 AB2pjljYcnlJKXqcsDjnLD76+bnhj/siy0M3EtCF8Vp5pp9XL72QVYwBJuzBYIWS+lzq1aLFTEI
 9Y16dS8rxnjyp6LsS1slpQffXGQ2vIy2E8xRjDEFxQaMkeIopMCbfVlaS2bL2VtaNxnSd8Q3v7c
 17mfrHP4dktLt74+fy6q16xhXDMNuV7Pap8LYbuSYp3Gn334GLWtvr5dSdpTrq48o90yKGsf1fl
 BHMN//26DXUBJ9Gkcgg==
X-Proofpoint-ORIG-GUID: HxG4bdBbub5i7X-TPY3Y06NqAN1IUtZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090091

The following changes since commit 9e2418490ba10d9c5dd58fcb56702b687639b211:

   Merge branch 'intel/xe3p_lpd_dmc' into 'main' (2026-01-09 00:49:42 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-lemans

for you to fetch changes up to a5cdffa580e8e6e4a098f6a73b803946ee9f1df1:

   qcom: Update DSP firmware for sa8775 platform (2026-01-09 11:11:10 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775 platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6692864 -> 6795264 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3084288 -> 3162112 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3084288 -> 3162112 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5881856 -> 5992448 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5853184 -> 5959680 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)


On 1/9/2026 5:23 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 11:15:28AM +0530, Venkata Kota wrote:
>> The following changes since commit 9e2418490ba10d9c5dd58fcb56702b687639b211:
>>
>>    Merge branch 'intel/xe3p_lpd_dmc' into 'main' (2026-01-09 00:49:42 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-lemans
>>
>> for you to fetch changes up to a5cdffa580e8e6e4a098f6a73b803946ee9f1df1:
>>
>>    qcom: Update DSP firmware for sa8775 platform (2026-01-09 11:11:10 +0530)
> 
> I think, you forgot to git push it. I don't see it in the repo.
Not Sure what happened. I pushed again. Please check now.>
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: Update DSP firmware for sa8775 platform
>>
>>   WHENCE                  |  10 +++++-----
>>   qcom/sa8775p/adsp.mbn   | Bin 6692864 -> 6795264 bytes
>>   qcom/sa8775p/cdsp0.mbn  | Bin 3084288 -> 3162112 bytes
>>   qcom/sa8775p/cdsp1.mbn  | Bin 3084288 -> 3162112 bytes
>>   qcom/sa8775p/gpdsp0.mbn | Bin 5881856 -> 5992448 bytes
>>   qcom/sa8775p/gpdsp1.mbn | Bin 5853184 -> 5959680 bytes
>>   6 files changed, 5 insertions(+), 5 deletions(-)
> 

