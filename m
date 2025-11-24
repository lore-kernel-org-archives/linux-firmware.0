Return-Path: <SRS0=CKkf=6A=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B49ACFD313
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Nov 2025 02:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39C68C116B1; Mon, 24 Nov 2025 02:15:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF834C113D0
	for <linux-firmware@kernel.org>; Mon, 24 Nov 2025 02:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF834C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANLDcR61683365
	for <linux-firmware@kernel.org>; Mon, 24 Nov 2025 02:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQ04LDr3Vk9oSGE6R8GEretklWrXa4Pu+AN5uqYGojQ=; b=ErWDukjR/dYPZ7rm
	1nBCdSql8bKF8n2muS3QJbqHxEKcvFLK5hmlELnwziDuqT8gIpb2xvBl5IwD+/eF
	95hGH1d02XXHQzmcQEC+Yijeoa2WgXCKWB4zgF3GQLw82MJoSi2TKBV5FrIAQ9Lq
	BZTag1UJDOz/oIxgwUUWl56wF0pZQuVJQZdsR2o5TLr2ngdlMY15z/6iR+72JHxC
	KHVXd0B/5ko8+nwTLuoOWtn8xCZe7pHMN/MMENpoSXRDxL88SDXFPZ6m6S3T6buR
	igoXyFHQeUG9540cM7v/yY5IsxmBnSvkcRxSKOtNHRUOD8BtF5TYglPNbt7ZtxXL
	cnYInw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama098cbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 24 Nov 2025 02:15:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34378c914b4so11867771a91.1
        for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 18:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763950541; x=1764555341; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQ04LDr3Vk9oSGE6R8GEretklWrXa4Pu+AN5uqYGojQ=;
        b=j6KtJ472loXAujCb6Kqnm4TCQOfqjViwx+BrSk22E19Ssc8F9lnw+8rXu/eDmydSQx
         3wml7/LdlB1rE/t8g2m1EsEnhuNZ70Ko0P0Zm/B7ERhoD5mrbHlu/4OJbto+EWvYHt0E
         Cj4ZLq+N1s1itFwq+Vm8RGKCXSCpAfVJgU+5LdSXhyvcfcx/w3ElMjYzXZ6ChT124cmL
         yAqPYVqrZVoIF6Oazz3S1L0RiPr+FXt0l3eiq8KHaGFF6WrYliE9ULzWswQ1D0jYNifo
         jKLYylZXUH1uHia4ABIW/6tCt7LhNZNaY7evKQu3Iak2ZOd7ooC+pGyrD08VQWuigJ2Z
         CJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763950541; x=1764555341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQ04LDr3Vk9oSGE6R8GEretklWrXa4Pu+AN5uqYGojQ=;
        b=tA3kOE37nOfGpI5y3Dgcs0RVzAQK5oKA0VwDL6omg0K1ijp+fQzjlIN2tCHO7N/umK
         tw5GjfXyy+3i+TZAPvMfMX+qWwDime7PZRtaUQl2r/UrKTytViWrhN9ibIbHtmhq6zX4
         cWi8b9gZPEyIBjwfUvl92lCONM7apio3ikxjm2qUuQnamWOrdoqk4Jpr7jyP6pS04UGc
         iY57y7dj0GNmNU8NhY5Tqo9vdzEBBKqaItfGLdJaOge/UCcWoZ2J6dmGTUKyL8ehjkoi
         qtA+7w3l3Z9HfnPaa8RKB0zGp8WW9OEuGHv48xlmbKhxRBEJVlS5y5Ka1jK9boqgSTDx
         HWEQ==
X-Gm-Message-State: AOJu0YwoICa7eranPOP0NFyUWtsqo9BcZMyP1CMogdG8gM92vSMAesT9
	Mog03N3dmkhPf7UnbJm4Ghrtn+spTdurdfFfZZvJZ9ECCkM8rK0ELJ9IfIiFeB0Xr6qXmXS2WhX
	XJuOtVFZGkE57Y5BqTOtsu2H0oVL56j2f/ja0iHeFa3MjixSNmrGfAi1BHZzfXGA=
X-Gm-Gg: ASbGncuFw3h04EzeheDvRYaYHY3iw5/vxKYuo67wLT4efzfmoYlmlHxAi7cAAr3xmYB
	qlgCLsmFyhfxEkiuEr2gI3bPTkp9mgi4XkN67zUq6OunHi73U2g05oXCX0vrp73Bp5cpO/0M3j7
	IkZ/KH1EqzxELs4Y3rR6XOgtSGqhQWnjMhc3Ybk8Nokreb1e2cwsespvLetucSn/0sKl8JqCkQe
	0emRQ8CUjlqyMCGhZ6fSyZOgkL3p7LfTro/u5YISoEV/EsyP9xkELbswvxWB7ZWhReAZS/L1Btz
	/EWvKTXO26y7iZQEm6QyGnlO39qxk282e87Cd6q8sO75wQzH4Mg07sgYXAahOUH97Km9pF6xACt
	dNPOR2Zq2sx4S91wvdSj3aRUXgLcIl8KOjYmc9L66C74fViWSG9uVNHnrsL7+aaZrbS295clCea
	LlFpzN7w==
X-Received: by 2002:a17:90b:5144:b0:339:cece:a99 with SMTP id 98e67ed59e1d1-34733e4cb3cmr8967393a91.13.1763950540858;
        Sun, 23 Nov 2025 18:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFls0BDTmQzyvGgLuvRbZdhOcrCoQD7frYDr9y8C9fqNf4P9HTx98+X4Xd2iztWztwQTLLzzA==
X-Received: by 2002:a17:90b:5144:b0:339:cece:a99 with SMTP id 98e67ed59e1d1-34733e4cb3cmr8967371a91.13.1763950540348;
        Sun, 23 Nov 2025 18:15:40 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693c501sm11655652a91.16.2025.11.23.18.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:15:40 -0800 (PST)
Message-ID: <7aff9b3c-64fe-4ddc-9345-191355e66133@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 10:15:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <12237382-ae28-45d8-9da1-af700cc22baf@oss.qualcomm.com>
 <umzkvpxgwxjhaamdif4id3ngu2xrdvodyd64abc3obcrftccwg@dejqillpsk3q>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <umzkvpxgwxjhaamdif4id3ngu2xrdvodyd64abc3obcrftccwg@dejqillpsk3q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T2qgDarTDsDQPnE_-g7g8ETLJF8PxUGl
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=6923bfcd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8
 a=hrbUADBfJo1i8iGZpIAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDAxOCBTYWx0ZWRfX/9se9Drp3TWe
 OYg9Oh0/LmdxsD2He5S+Jvn837DiMT6MEz5yL8iBr3qOpmllAmzfnljDt75XEA0qj6TOsJcQdqe
 7Wx2Pyz3bfiSxIEHs7ZLLBLL9obuVEHpj0b3l12q+JhsgHyk8hIKynizjuJJo/pOXZbskcy5WC5
 PGV9alvefedY0anwj6frc2YTk0ANW7PD+Me434Fz4dS9EBDjsktfeYDXmnKYqaPGv0z7jO4HT6a
 1Xy1bcnDyzzJUCY7yJgko/aI2gPnLM9cvhkqxWq+/QrQcPOYn9RbTDykbl49roMPdXJo3mdvEL1
 nq+11i2Yn8xNtrnLow8ZsdDzwyGY4YCKdyjoTH+Q15zHTLReLbHwntsGfHqk7vHNUXB5tx1ODOn
 dJsDHMZ81VG1ep8u38j9B4GjDkBBAA==
X-Proofpoint-GUID: T2qgDarTDsDQPnE_-g7g8ETLJF8PxUGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240018


On 11/23/2025 10:11 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 12:11:02PM +0800, Renjiang Han wrote:
>> Hi
>>
>> The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:
>>
>>    Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 12:02:02
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> update-video-fw-v5.4
>>
>> for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:
>>
>>    qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41
>> +0530)
>>
>> ----------------------------------------------------------------
>> Renjiang Han (2):
>>        qcom: venus-5.4: remove unused firmware file
>>        qcom: venus-5.4: update firmware binary for v5.4
> I've set to be merged, https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/793
>
> In future, please, write better explanations in commit messages. Target
> people who will read it in attempt to understand if it should be picked
> up for something like Debian stable rather than your close colleagues
> who perfectly know what the issue is.
>
> Also please coordinate your uploads with Vikash and Dikshita. The _s2
> suffix was totally not in line with other suffixes used beforehand or
> after.
Got it. Thanks!
>>   WHENCE                      |   6 +-----
>>   qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>>   qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>>   3 files changed, 1 insertion(+), 5 deletions(-)
>>   delete mode 100644 qcom/venus-5.4/venus_s2.mbn
>>
>> -- 
>> Best regards,
>> Renjiang Han
>>
-- 
Best regards,
Renjiang Han

