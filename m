Return-Path: <SRS0=Z4Oz=BD=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFE1D58E4E
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 04:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6EC3C2BC9E; Tue,  3 Mar 2026 04:00:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC825C116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 04:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC825C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6230rYVd669789
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 04:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URi2rySxgY2WbrGDJS8zIOTMYyka2bbbzJCT0A8J7qg=; b=eJJiMxBm1PmqZ4lF
	4y3vjSFt6jgPS2VvxmqfGF70ko5+KF0ACJCJQd/EeFjDbC6LIpYkRbKRcF41mREh
	rNOSPTPX1eZmrpjHzdgShxCo9zg3KQDjR8QK6A1OsVQeIodppxuQpNF13dENR2Cc
	J4qaS06ENUbH96vdVmmMyLo7K7hdER98frJ48lQ6dEIdBKHHyKhPHf1vp0pAwCUL
	AhgPb9Ryn8x21GIHWfP6i18XvB5nQE04YRuUEmW6AFvsSyc692MfdRT7mVePROG9
	7YxSooW31tmjd8k3vs0MXmu4dOZbQieXOQETqvafYI4YOVPgQ9Ec4ZKEqtCHYisW
	DG26bg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngg8jds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 04:00:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso4180532a12.1
        for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 20:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772510400; x=1773115200; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URi2rySxgY2WbrGDJS8zIOTMYyka2bbbzJCT0A8J7qg=;
        b=IzWppMKBDbL0ykqU2TX885wkjz8ZfdHmINP/qorH/yAR+U6nJBRmfRsfNsanwKe//y
         AIjk4JcyZ4sRVpztF+bicZKVFwbPDO6Wu0y5gAgmFp7Phvxx+d2a+RDqwZ7tqNTiqkpa
         nOqn+qWCLd/IlMj8OAGfi9rgShNLcZYEfdqgOM5rdaHLRPXeZSUh8W4F/I6hV7I35bVm
         Qw9mgaYcgxFB77xZNrMa4GkfEwL5bMxUNZCtYUO7h6HEcAFqjLIooGNRxtFg/pXhe0O6
         KV2ptKBur7ON8FhwZvsTQgIOhrZz+FA3JsdS+h24863DatRninP0OQg5D948x5+Zxywn
         oGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772510400; x=1773115200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URi2rySxgY2WbrGDJS8zIOTMYyka2bbbzJCT0A8J7qg=;
        b=JaR2nDSHUw1ZoI8575phoPf+TzNHSKQo9uAn/poGegsq3xJaYRdloQNlyuDdsao/iY
         KxPCQMc0pp4tcRWnCEC0AiKbQJI3ItYi56uQZqfNtWPR2Yj641WScUYmKLwVxLBDk45Q
         hpiBIQHfo7JHiTJVeAvXTvKQX1GHLgNOD2VSp2E3NnfUPHajH80ciEHkcZZkBzat2p5y
         MlMF85zcKI1pPxipp71jQuODP6XD8+W1IFkL9KJ5+22pRiyBnhvnkUYRCI1R/uMvT/Fp
         ANa2WkVohv8h/OipG8SaM71rT6BiStl1YHu2LGfoS2R1qzKzGNQQ4N84RH8/z9kFYiOh
         vbww==
X-Gm-Message-State: AOJu0YydvhRwRCW8JHTwuS2GZfzE8zGYmwt97G51kbNwKdDvh+JEfShj
	jGK5XC4b2PjhvILiZsXSd6tYH92xarAA5mfX2WvI+zTWCNhk1Qt9Wi4v3jxx6nutW9gGtQlBUYK
	PkwODv+W1ku3RWoYTKugTL+qtlXvcV5gyIFSdl7CQhl+583orQRAOasHHymuIADk=
X-Gm-Gg: ATEYQzx0BvOra+vKw0fw8rilBBNzbFuEoFSUCmH2oCqpMwwhj+lSLWNKaKBZ7NrsXqE
	lCCZBTveQMyOMJ93s5BCjuHzWPnh5ORIGhFAGcImSwJKbZN49Qy6AlX+Xn56tR3Vx+qX9EEcm5D
	dEWiUHmQ50lFeeu7n2PGWwDYPUmO+KNNtzJHJs0RgD60z2jF0olpCvHFYIBDZ1VDDpfRLQ1sNI/
	6Z8ePomA4vD+f9TznfeAkmp0Tym5voG4JiLw7V48D1guuXKa619mmDeUCGggMI580M4DO7NTM+x
	YwzM8ewcdP5Qx8xetRfCXwDaRoR3LRuKRUkSXB6n3gP+YgGKY19Ca3iQNIpHKGeuvgP/TdrKXF4
	qi/CE1mvFJv1ZzVTMXKuHHAXtaDu/cI316gzBdk60vwDkXaBx0qBL
X-Received: by 2002:a05:6a00:2d0c:b0:81f:9b97:5e4f with SMTP id d2e1a72fcca58-8274da13391mr14594299b3a.47.1772510400049;
        Mon, 02 Mar 2026 20:00:00 -0800 (PST)
X-Received: by 2002:a05:6a00:2d0c:b0:81f:9b97:5e4f with SMTP id d2e1a72fcca58-8274da13391mr14594274b3a.47.1772510399528;
        Mon, 02 Mar 2026 19:59:59 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff32f3sm14441564b3a.33.2026.03.02.19.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 19:59:59 -0800 (PST)
Message-ID: <9428baf8-93d0-4908-9808-d60033a5d894@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 09:29:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
References: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
 <kewyupqb3z6sh3jnuqzecigjx3is4mt26uc5wil5cybd7dzrtj@yaopwhgqdaoy>
 <4c6945ef-e5c2-4d35-9be6-a304c66f7043@oss.qualcomm.com>
 <7mbt2k3gqhxs45l527miwjz4b7zrqegjmlhyi64i62uombffab@4nua6tiy7usu>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <7mbt2k3gqhxs45l527miwjz4b7zrqegjmlhyi64i62uombffab@4nua6tiy7usu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a65cc0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wKwHqwZ9Y4uBFgwKtrIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 20Q2YbtXc6X1xrnBEb5BQkUdEjdJBSk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAyMiBTYWx0ZWRfX3Shv2pCbqacC
 itHYA1b4JcTEbQ2l3Tj4iLHswU41+FeRZrCiSkTctpkGKMqd64ijhqIhcMX5z5FIyJeEg9Web0m
 iD36kOl7nrP9YXuTnrJA7a1NFyfI27KaEp3QLjwfy6UDYRec354pbuai2hP6l70KAYd0tkqrpkX
 jFmDhNVOl8BzuJrIKV0E3RCFEon8oPzg2XzWs/t+jrQI771E3PpJGo4uyQ3Pc6zd7kQnd0mztys
 Puqs9U/p7bhIke9LC2DMZcoz7buUGSPDpg0o1fMIDvbByVovf0El+FuGNV8LW0SrNRpxSWPkCJW
 qfK1oELeMvcwAjeS7zxjGOtybaM/xm+DK7/B2i0jtW+KTFHE1s1FFbsy/ml1iKkc5Er71UK2eVn
 07psyeEKOkl9k9NyTnPtQEVHTkl9w9OTX5gh3iNF3q4+boKs9bxMvr3NuGY8kV6T5ARf+eDXquV
 jlffSWMGDPA59c1XBbg==
X-Proofpoint-ORIG-GUID: 20Q2YbtXc6X1xrnBEb5BQkUdEjdJBSk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030022

updated commit message.

On 3/2/2026 4:33 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 02:02:08PM +0530, Saddam Patan wrote:
>> We observed a bootup failure in Glymur caused by a corrupted adsp_dtb.mbn
>> file. The corruption occurred during the ELF → MBN rename process while
>> upstreaming. This PR includes the corrected adsp_dtb.mbn to resolve the
>> issue
>> On 3/2/2026 12:38 PM, Dmitry Baryshkov wrote:
>>> Missing commit message. Please explain, what is going on, why you are
>>> updating only the dtb.mbn file.
>>
> 
> Let me reiterate my first phrase: "Missing commit message".
> 

