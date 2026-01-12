Return-Path: <SRS0=N8LK=7R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02F1D25039
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 07:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 776FBC19422; Mon, 12 Jan 2026 07:15:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 912A3C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 912A3C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C00IXW078499
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gEtegBJXBZZsn79yh1jpfiL1
	dNFyQikk5q+rfZNtPss=; b=MQhhDOItGBs2xjAyjN+qt1nB39waPTL1ny6kjhBh
	kL2RQK7KR8mPLoNS2f32OX26aR+Pd/yc5WvR/DSuPPXW0lYg8RVUqK3JEz7gunHo
	GvFUpuEZ8ql/WUL8fsZ7b9FA+E1/nf8v+caE5vMqXO3JBVeeEbN6LWZLMFtAQTp8
	g8nMONUqfizw3XzSdGE6ZYSafNAKwlpPgKi0vCKocMnHBFhIpfO+qY6NW7nZGhJ5
	r4u4MDdtG6Mf4s0utH6Pb7M2nTf+ZpwnA5H8+mnrtp4ouadmkrA2vSwFBKRUqKs3
	OeRf4mtKOgQue0zVsrCEWnCd04yr/e4oFmUOaNhTXjWPaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3y8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:15:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2a3a614b5so1402908485a.0
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 23:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768202113; x=1768806913; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEtegBJXBZZsn79yh1jpfiL1dNFyQikk5q+rfZNtPss=;
        b=SX67XQ3FVMHyq7txosSrDki4EQqLKKGjhej5zn7Mw7sB5/7Rtpb8E1OLPEkfhH3+Zs
         LM6CqIiBBOhXJfAGoYF1PChnXni9f1ajuXr5+9EyC8CmEzrl/jNIUZ5HPspqYtsu4Nh5
         LqQwavOg5qQti0QvWptHdEjkHQGSHveepY1Om7Yx2q1wqxkA3tS0hCQtdntQLCJO3mrr
         nCdxjwULHRSgkGhisE6EY8rI8sUtb0SNi7Q3VoF8U2lQKvZLqRjtzlmhuBcb66UZP/js
         8RxVCVQUM/UFhhmvVdYylVb9pq6otYlnYDjNQKgJFwHWwRJnFYggKTJ6EPVwhOcufYA0
         ADyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202113; x=1768806913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEtegBJXBZZsn79yh1jpfiL1dNFyQikk5q+rfZNtPss=;
        b=QCf4mylYQxpp2EhEqWUMF1yP3+8peelRp6DNEfMeWotg805dnD2XTWmll4aGxRVIHe
         bWpHQ3+2Cz2MRHj8heCGX3gPmGMkYFjTeUCm1qV06Z9VtHpeC9zr4H26O/pU24VjDsca
         CyhPsXt9sIiZ0Oqcu3Xi4EyACWh5CbHKXg6qzatoBVYiZBDbJPhtnChRUH0cFFyOm/TS
         qf/bixmrwCnKfpQb6+pZvuJFGeLvI6ir2C/tPQQKDdCtwtzwYp2CWKjR7qzYfNeE9sH6
         j/pqRUg1xrdtw2/7sl5bWgE68BFkb2J3t0tCkKIuOrolskbBuir6QrNbz3x3VQ/+RI0g
         lRew==
X-Gm-Message-State: AOJu0YyRcDJEldTjDm0KjSNonVE9SYeXFLZHQm0WoM3nivz5iFJuoyrg
	ThJaSXQOPNkLMeg3hKBRm9fqoxrbXzIsfGFz1DZZ0hdjnDLwuMj2xKt7MyY+J4J1Bc2XEtVdZmX
	Vzo5azno++TBTnWk0AxmPp6Bx4acdaWWbcUSLof7IK1qzfCbOjjDHbN9OiAW4zCcFVlpCDm8=
X-Gm-Gg: AY/fxX7OgxmU6cd0M3a0lBVdKGdf03fY9jAGtewSMu17YhxnySMR4jufn6z/VQVd4At
	L+QojM6j7V9hT1WQKSJcn3PC90DqwUMVZ9aVEPjlRJ6wsAPkhb3jwH0/Pukg3Mz6X7AkYIaWMR6
	lRz58p2eBex7kqnk4erZ19di+JPhE1OOAfoSBYuEpXt2zIMmqztS8zhmuAmKi2f1nFgZ1ZfFkKC
	zBc6SrcI4eM5DCwHsxJ4a9TGknegymwLmGQ9hxMEKrZqDlg7mRnw9o3PaNqbA79ieMfBOTXQQe4
	ltd4c5sY7rbKy1pWtjA+bUzdhIxzuHmgWP0WrJbVBRyDyoP198gcYHBVXm/SFTNlPGVJnlvDwIC
	nUpkREcBI108Z4zjVASfAUEoLZU3rxkizwKRPZrNDjfNrEv4I8BnyVgQdGc0kv8MOt67jIsUsM7
	PJBSN+56NFEEmADG77nQK0SPU=
X-Received: by 2002:a05:620a:198e:b0:8b2:9b48:605e with SMTP id af79cd13be357-8c37f54e46dmr2678254185a.38.1768202113334;
        Sun, 11 Jan 2026 23:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdeO9KZWrexDadK79jpyutl1sr53svPhB9nutd6LUqNfQqidMQCvRKVZK36y0U7mBNO9ta1A==
X-Received: by 2002:a05:620a:198e:b0:8b2:9b48:605e with SMTP id af79cd13be357-8c37f54e46dmr2678252285a.38.1768202112852;
        Sun, 11 Jan 2026 23:15:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6cf54bdfsm4069052e87.52.2026.01.11.23.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:15:12 -0800 (PST)
Date: Mon, 12 Jan 2026 09:15:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
Message-ID: <ujhtllf7hmqjxzdnzmfonbijrtaweta2mpnwtjagk6n5cfcgbt@2lhj6wntvdla>
References: <4c7be2e1-98ad-42b6-bec7-6ffde9a9951c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c7be2e1-98ad-42b6-bec7-6ffde9a9951c@oss.qualcomm.com>
X-Proofpoint-GUID: F3HQIjsrp_NfXTZ476TQ41UGtgcmwdC8
X-Proofpoint-ORIG-GUID: F3HQIjsrp_NfXTZ476TQ41UGtgcmwdC8
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69649f82 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=PMH52v3huzV9ibO0koMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NCBTYWx0ZWRfXy7XNeIYjNny8
 DsiI6gR7RNOZVH2dV4T1YPdFuPeBPRhVBRNSaoqdnfi5ku9ItMwiM1uXbTABlU8yv7mjlhAlgzS
 7k314t976t27fwarV1fot1D7Kr/6OehcMl6t9UasufZ4ndmlHN+tAyq5GQ/3i6KSyFrLZ6ITDIN
 +NB+Ql5jkquKhORlfST6ckawK9KK3ExFUxqNwMyo/RKpGx7d1WL/L7B96CIPfBQU8wQx3i1SNQ1
 cShiIqYruejrT/ZZmJTtjfsi9I9QwN2XIjE8gBRZbGw75TL7yh2Zf26OySNPGU991/JwZk0SfE3
 8STBs2sEJbEhu2bFTu9GvDp3cqbIs1sAQkGIdOlMbrMwyg2h5Qf7hqtQPH0ZhVI8d2rKOBoRjN/
 hipC00XV9vfar/KHHotpfm2tuvT58KQbE2cVj/H7t1B2TBJCLYS0g+1wSNObUiWjWdjBBvbZm5m
 Rzpmr4oX6u0/XQQXvlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120054

On Mon, Jan 12, 2026 at 11:38:40AM +0530, Venkata Kota wrote:
> The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
> 
>   Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-kodiak
> 
> for you to fetch changes up to a438fce32e0e406fc76f9631da88c4d81a95a010:
> 
>   qcom: Update DSP firmware for QCM6490 platform (2026-01-12 11:16:10 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for QCM6490 platform
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/857

-- 
With best wishes
Dmitry
