Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB3606A326
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Nov 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HNexjfuv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpQqsDKb
Received: by smtp.kernel.org (Postfix)
	id C2E771F00919; Tue,  3 Nov 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793666565;
	b=BNa8iintvxWfFXJeJKq2CZiHLTgu/Yc9cRlR7V0AGTIw70KBW788/teKP3QlpOmdhnCZ
	 siJwiXrWSoYkXvXJePEqE2fUCnukyyu8fsbT0YkFc1LYefBDsmT4sqvaOcAsDP7zn3CZI
	 kLVhAL4GTkbhxEUdHPjIFGpm01T2d4AcPa0Z/nF0TtVI/pmPRiue8NoOc2p7QQ5SzZuLg
	 HBeegApCc6oC8xzJAtsOY2w3iNXJs11rEb7DiMn0z0MiPBh9McJIOWGzHNJtgjL77aEQE
	 EM07AP9hN7nNKQt1RFTkXg7SUJdJPoFxWAFowZmcmSvzrNQ9w9ApYmB0kchU3iuvDaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793666565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Zb8O/Wb6DSly38/gMcK2zTcFah4L7jwe921G7y9fWE=;
	b=dSm+EFof8oF7IPTgPt6Kp5dnWxhNcCA4/FJG7C03mzCUGVHFeAYvwKxpkmCUmdY1PA6f
	 1o/ZEEYeP9AqxUisful6GRTeEjvpiwvE/wqDbzXr/oKF5St93qLMVJb9Gm4CqnmJQkBsM
	 lceS/Xed3zurgmG79JtXzO1GYhCmZwjVW08v5V4QLOif2zrOIGFDczRNSGlfZi14cfGkj
	 FLg4N8H65li9R4yfqU3SSw4jj0OScPDwQDd3iiFXooxscCRJ4OZ7Eg6FfYphA/fEMz/LA
	 DN5/rHq1nkyaj3LpZDv+Ik3P0FUcEb6Iq2XtWbZP0SizAWErBKRaRyyK6ZaFETgyDbw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HNexjfuv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpQqsDKb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 136151F000C1
	for <linux-firmware@kernel.org>; Tue,  3 Nov 2026 00:42:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HNexjfuv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpQqsDKb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 136151F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6DYd720417
	for <linux-firmware@kernel.org>; Tue, 3 Nov 2026 00:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Zb8O/Wb6DSly38/gMcK2zTcFah4L7jwe921G7y9fWE=; b=HNexjfuvyb4Q1/1P
	XKsozcgAH43NtrPEEgTRTDIld8jPQRQKuCKPxhhLO3RXFBJGyzceapyztGBXIxc1
	aqegyNZpHGoxwemOW73v2CC28p2TI9z7zaudVoiBkuMwTts95OeYobR4KvOtf0OV
	QFW3PV1k6psYvLtX6tKp4s5Iic6fle1Jy3yhGSBiYguhBRl75WdIFKrpihK9gy3I
	/mqq0wdnKfcKtc84zvbdwMU3RAAf7RFbUvC1fX4C95jYjSzozCkXmx7X991fGVqQ
	H/uKk1XqZcCAYnegU24h8AipmBmoi2x0hhbEZPnEleo/hKsBJKGTUdFZvCuoVWcc
	U3Jsog==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08715se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Nov 2026 00:42:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1ac19c6bc71so2687121c88.0
        for <linux-firmware@kernel.org>; Mon, 02 Nov 2026 16:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793666563; x=1794271363; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Zb8O/Wb6DSly38/gMcK2zTcFah4L7jwe921G7y9fWE=;
        b=SpQqsDKbwnRAK39RM/IFsqWV4f1qTH9YUjblookpD5M9SiaD378p0GedDp0l1UDyRh
         Yva4Y4GAFSEHoPs4kSxALQMhjgbPED68wyKlABfEF0nbiof6KcEgOJhnvkW46rteQq93
         Up6pb6WdUrhq8xW8ytdn6oEfXQ4OV5+3CrFmq2wUd6Eca/BgjLjpbS5V2vG80Tst+CSg
         V1FLZp9U8PQpygyUj7Ek/zXcnm3gixVFr3UikEXCv5+O7zFpt0hnLzaykFOLeLVk7tjG
         1mSzF/LXfrwqFP6psZVmWxMF1+VeIlkHYSsVF6YT+v6pVYJTWf+xRNUi2KSSAzJc/8Da
         4DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666563; x=1794271363;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Zb8O/Wb6DSly38/gMcK2zTcFah4L7jwe921G7y9fWE=;
        b=VrpI7aDhZSbIqU5z/9a59j767BnEdTnVZivQqk3wvDsoV6lF2ccGM/CmG+qHCVKmYb
         zwRMqXtHkbJw2sMwPqhv9POeBheI99jMCC2Wo5CwiynEvfqm9FiATNRFAQeKtS1A++dN
         aya122Y3HjxkDUDNmOYRdLUT85EvBL2ivtedm10mA475ftDwosr1PynshZ2Mwb2qFXjN
         qp2HBo/7ZpVAX3yeZlZy0oJ2N/8ybH1IZjzpZBLRHAcXdzqeCYv1DKSOhTAK1Po1ohQz
         cctsnoF1eXCYsiNqOfDDXYVkIRAOVqq1ITamu9i9MhC+NEMNOlzxrc/IGmjDHMpPD2Rw
         bW4g==
X-Gm-Message-State: AFq9FYJHcj50YIlX9P1ril9hNjRQpoO3NXHSdu5Agny9mXm5zJ8waXse
	lYCjWDwqIRn8cX0w12TFYbo6Xz7gZFV9i9ONE7sZRZkPXovk+YxhoBXhyzd5irx3VAL4xDTOut7
	aej1gEODFVk0IvEq+/o3Xl35YdJeNAm25nSk0YeS13oBZnlPKsWhbr/ZNZZrqQXo9i3NsTu0=
X-Gm-Gg: AYBFou06yzcFG6SyNxFhXubmaIhktb96UrYe/h5vqjh/Xmz5VKBRxIvcFAKYiYlMo3Y
	K/O/2Tqb9Gi5k5/aFuT4ERP41KMKFN9e6b5jO1My95HNMXrDN7ArUcRbEk1/flbkds67OOgO6d0
	2IMx6bdt1vCTKvhtIqhyGjOzlvAep6tXTLhqLLqWNnD9kLrX7GmOywauabTOoAr03Xj0OYw9jHH
	Xo3M+qR6dZjAooRZHgNkBJ5HzkHBcyJzNkeN0tjt/XzJy82bI3JJADnEqUJwtvYLU64EO5G5XCx
	qfJ23AxTAR43DGx6JzCF64BxaNmUZcz54bPNeWQAUxx8LgNi2wRyyvIV9oi70cW3G029/ukexMz
	tZR5SYuiZqKfnC6Z1jemKeLlBY77NYWkKewQT2y7oG4EiBzFF28ZCllvmWwzWRIIQX5A+Jo5+wa
	HDrQc=
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr12326474c88.23.1793666562547;
        Mon, 02 Nov 2026 16:42:42 -0800 (PST)
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr12326425c88.23.1793666561730;
        Mon, 02 Nov 2026 16:42:41 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm37459294c88.15.2026.11.02.16.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:42:41 -0800 (PST)
Message-ID: <a35725c5-f54f-4c01-a252-3c9688ee15e1@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 06:12:38 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Update HPASS firmware for Qualcomm nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <07f7217a-f80e-4d63-ac36-5466f30f5911@oss.qualcomm.com>
 <pwpkbhcdex5pf25pygzrl4ljcsxd2oqktpvwgcnoqc5its75cv@eh6kzao7kzci>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <pwpkbhcdex5pf25pygzrl4ljcsxd2oqktpvwgcnoqc5its75cv@eh6kzao7kzci>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX0AfygFMQ/s6b
 /35nGQSWuuYCGJ80WRYL4j2aS1UxMnnpiO1RcL6GlA/HQJaZQsBNRivW7Lt5eeZwi2AjqpDCdhG
 R3F1VgTr2nRwCazFHx7BAbOvZs3k1ew=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae92e03 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=hMFmYw0pfWruXljt3GkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfXwtOi82LxhPg6
 Ch/ub1KfB7/lhsauOwvTEcfs7zepxEde6ZcNEA8h1/FZ+PcHiuLIBTmSBYo3lo6a1cdOqnaHHBn
 4oA5eZHKmMeqSK2vbVsfiFb+NWfz131pZhmTNrBuBIDAvvjHhNg8ipUlBO1x8He7537DpkjYbZV
 +7qzF+PP+uspD77gXa2D3yhfl6k6gBr4qFeE7AiN4KSy/rVonTxQ8BA/XkJMdnzbJYblCWbC5Au
 aLxBNtEHXmmAoJdye64AqpRVz/4yFP4tdo6oTPY+gaFUFp1s8odli5fjSy/tGJK0loKAnfU/AQI
 fDaUeYf2CgJ39hsriiKJHdRKwtrZtlQP0NItjObmfFBR8Bcl7yjr6/INfGH/x++PLqNnNCrvg5i
 9UeScipWL386T9G6d4TTyA7V3Klo4APbSyOoZ4I2RpYbC0hGAcAz5fVZovcdIxGUXu5NLlvW6pE
 oG0vxeXsIUnp1lXVFcA==
X-Proofpoint-ORIG-GUID: mky34JyIH8B2n-JXGNEktkyGY6NEkz-D
X-Proofpoint-GUID: mky34JyIH8B2n-JXGNEktkyGY6NEkz-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030001
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/2026 11:28 PM, Dmitry Baryshkov wrote:
> On Sun, Nov 01, 2026 at 12:54:39PM +0530, Venkata Kota wrote:
>> The following changes since commit bda6eccc3a8f52e00696cf733b6e4f042d56655c:
>>
>>    Merge branch 'robot/pr-0-1793289289' into 'main' (2026-10-31 18:25:38
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qli-fw-nord
>>
>> for you to fetch changes up to 28013a9738ae2809faef40e1d1bda735af8dd011:
>>
>>    Update HPASS firmware for Qualcomm nord platform. (2026-11-01 12:50:25
>> +0530)
> 
> Why is the version going backwards? From HPASS.AT.1.0.1 brach to
> HPASS.AT.1.0 ?

It is not going backwards. The version is typically major.minor.subminor 
and so on. We earlier created a sub branch 1.0.1 as Auto-Audio was not 
aligned on QLI with some concerns, with respect to some third party libs 
upstream, However, they have now figured a way to support with the 
supported upstream libs and we chose to move to the mainline and avoid 
propagation efforts to this branch. This movement to 1.0 is forward step 
if any to align with the code churn happening on Auto.1.0.1 would be a 
End Of Life right away.

> 

