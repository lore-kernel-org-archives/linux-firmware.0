Return-Path: <SRS0=+hra=ID=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13037CC6B0E
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Oct 2026 07:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DED1F1F00893; Tue, 13 Oct 2026 07:34:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791876886;
	b=BdukWpX0uy7wlpPvL3oFcLB0ntx7UK0W/rPva9kRrGpFwkZAoN9Gz1V5uooPDDQ4mKXw
	 lrts+ospd4mXWmsLe+OPsMjxqHVWsr7EusKX0INGAgWtSgk4zzNl20o5H8lSH7Cqfc567
	 yYoh7tRMbzgY2leq6D5L0OLE2ncwtNDd7fPAP0aVKIDXNN96Ks50Oat2UtR9terRU61V4
	 0tCBFCM2yehWhQUY4/SiANcEewTn7ETobv2zj+Eb1Sg9YJJUsYB9kfq6BrzwCxjdR0Os7
	 u1EkjUSRpnZLSGRnbdAAHshmulun3cp2rLDBMieMJHftu5DmHK2cBFL+0ymEOVssAQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791876886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tvOwhU2xtqiHhBwiLzjKnzlQF8BpWYnokVg9qGLGOMg=;
	b=usEqlJ6faO320bLlryxufSRngLl2nDVejnxhVV6SRHBlfTtU8HEAbHahZ+YWFaO+Mjdy
	 Tr+RHQm69ikZs8YAks2HbNpjLoButwo1JPdbmC6DPO1VWn437AWDx0CKfzXYB7sxamlLK
	 w9fLu7f9w1YHgZPk9oEWXaE/06xd2nXGyIGnSNYlwGnpg8MjIcboj+waY/XFVEB09EkyP
	 JwX6GZ2X/4E1JnbaZ0lmL8TWBPdnTa+4hypIuuDU0VyRkm3eoQPRKIt1mVy7RnELtAE/f
	 HnDDxMRr2H3xp5/9dR3sEdkp42ooWXkB4linLhuBFJTklmWdg1nQQQSoD2CDqQ0Ubfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lrXHOCu+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cCatsXMt;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37C0C1F000FF
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 07:34:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lrXHOCu+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cCatsXMt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 37C0C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20uC7302956
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 07:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvOwhU2xtqiHhBwiLzjKnzlQF8BpWYnokVg9qGLGOMg=; b=lrXHOCu+8Y/mITdS
	9ijHhNO5jvjQBN9Lurg4qjQSNVfIZattqPV4IEsbyGLxZUt0c+xocSE/OnWL7T2A
	wW6cIg3dHJGGcwxpFrmiIboKciaRiM18KlOS+/aAwaw3dJ3UaSxj2KVB96xH0A2l
	3/Rsfuf9phyLczYeprKkr5JpJxhz+gp4ncLf+wfmXcfsIGC5GL5zEHEOH8vkY1Xz
	UPIUHvf/YBfzV2Fc1KgwH+01AkH8gFT+rPVRxcf5yWeb8b+F3SDUZx6I7z/IPBUS
	dhQ+n3FpsupBe3z/oBlqYXxCmZSnwcAWgcLBfvGDosLCj0m7CoXrQgX1wWpfu0mW
	4dOorQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9my2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 07:34:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so3979095a91.0
        for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876884; x=1792481684; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvOwhU2xtqiHhBwiLzjKnzlQF8BpWYnokVg9qGLGOMg=;
        b=cCatsXMtFxkCwq5DX8ZU3PU4eWOduwOZHXWCDonVwMvPAUiWj46/20l9jWu+FKd92g
         X+3k1Vh+6R1kvEtoy6F1Dohl/z9gESFxeqCGzF0YrzQzo66owDn8t//jR298Sb8AlQZV
         XPZoTimsHSjJ1bwZ+PnSEAQ1ojKyDHmQ6VkMb7kjalOt9wulQYN8xDjF0AQG1lTs87hI
         Ce2d1RlLsN6GPQvAOC1mWq0Fzjg57rh9/rzjUL6WCY8KihPkGnMPp30JzvdDeTt6aS7j
         7utfvCukv2+T80bJTsrIw4gkvkrUuod9Wv6PdfAI6CEQhtdM9jUxPeqqxz4Mppz77WXq
         O0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876884; x=1792481684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvOwhU2xtqiHhBwiLzjKnzlQF8BpWYnokVg9qGLGOMg=;
        b=25kxIj5J5SxcgS2Tu7+vtRYb3a0GLoRNzEVg24dz6Hyu+Vv08wxcmmY5kaZZ13g5Qk
         eLkX5Di4kpGYem2hQwU0zEE1JqszG45ZzQECZroLUXRwuPvGK5kYo4J4D/BYezIr5DRc
         RMVol3zaSIBpuStJGnDDD4J4eJO1bmUoK3FyiKZaTE1JvY99xTPlx/ZDZH1jdIjFep5t
         +2hK/mlNrm6/Iv0/pHpz1OvFMfMrVl/4zHLvzG+WnX1TirjRIcofADrL/2AAfDw5WndV
         Io/ULAVoz0DqUtCufCSTtZgsEQTFuIdJxX8luu0jxNrZQOykICNOJDhPw+5Y2uBNGLpm
         b/Vg==
X-Gm-Message-State: AFq9FYKpsE3B9OAoIVjzpjGcuvdHhBTkm7eXsxvRnp9HC7PJhTWRoEfr
	pdEsW5ANRCIqE/hOOogdxniFJ1Wl9JvUUyXc05CdVdMYMsGqHfJ3gUv1D+iGjDaB7O8g+NG77mb
	Ao0aU+UXth1EkqalKmyhnsJ0nb+tPacjjlAi5KRPmrGG3Wf1EXK1fKATssRZpkpA=
X-Gm-Gg: AYBFou3T8+DlaC4HkDU63/qS1A40df4TYQZJTrTECNzYa0b2Wv1CYB425pyYuwkUSkh
	5JiUEh08AAID3/wmwKuyYUMG9zvp10lEx2N6p9Szuz8mUodziN+pwSdXGzaz/mq9A2ycP5GYz6B
	hvyroBBU02KxJpavZvrABDgXJWa74BdhRNXrX0vprwK+1Xv70g9WKw5YNuVnLT0SxuAaVtT641I
	aw9WC4pNd6l0gKr3sGOKo+Ua/4yAjRsEE4M3iz6VqajS5GX8RxtxXwChAsXeLtQMpyGEnnmEmuN
	dkMg3Z6sidLjy1hRjpem09A63Vvh/evoIGLAGHQ8IvqPkA2ad4vOk4mhxsHL5kHuzzL7+tzk8wb
	89AeQ0emZ/AivCDwfhiG4ArJEQg3p
X-Received: by 2002:a17:90b:3b90:b0:3ac:17c:6e72 with SMTP id 98e67ed59e1d1-3ac017c6fc4mr4316797a91.11.1791876884317;
        Tue, 13 Oct 2026 00:34:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3b90:b0:3ac:17c:6e72 with SMTP id 98e67ed59e1d1-3ac017c6fc4mr4316771a91.11.1791876883774;
        Tue, 13 Oct 2026 00:34:43 -0700 (PDT)
Received: from [10.219.56.101] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm20262523a91.13.2026.10.13.00.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:34:43 -0700 (PDT)
Message-ID: <ad1da67a-732d-48cb-a632-51ad23a43846@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:04:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update HPASS firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
References: <9a5d20e3-c72c-4c55-b4a6-87a5b107e9ce@oss.qualcomm.com>
 <wc6pbbqet76yquevnlbou7igq2ge4zp2xtgnjshgu2cuv3dzid@ec6wkouipgox>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <wc6pbbqet76yquevnlbou7igq2ge4zp2xtgnjshgu2cuv3dzid@ec6wkouipgox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX7lk252zufBvx
 eLaUlIgws+5vYFUXe7N3wKUenA17GqOkwTvQq8KKQe7JT3llO0l21iRX8VNzOxesuUuSAtuEnuI
 Do2/JfvPd2pxL3EeMFeoJ8RLwQWNh+pFOXNlTXA4e4kRBbrx4DL7yFmPe/+r19A567bBIaigICZ
 egmou9EyLGMCbtVwQEGsL9939zKSWGfmswJ1KJah6NfPW73uYeBUDlHtiuIxJsqywwe1pyqXJ2S
 efKLXebten+NIeZ7XyyHKTefFgnVc8MD2lPwFvYyTZyVU9wsmKZtcJZaCZJdnzNzcUjYSuSbRWA
 +Rhv4dKyvALEjISLo0U5z2y3zvG6D2dREI9H0DsYHwYX1n+tv6osaDdfc/9WvnDOP2p1JlGD5TL
 x5S3r5GTrzPZXmeN4cCcworSkz/9/sI34vkngAbpPgT+Wqg2P7rHtvPTVRuXpeZK3dyNv2INvtc
 oplOhlXzv0RXIf9SGVA==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acddf15 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=f28FJyRPL2d07ICro5sA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfXwE6tq6qgrHij
 RM2XXz3GHPAf9jIMj5fILZRxOveH0jfQjPtlAsmD7ywl65iplaFbVFEOR+VPFR9S7ag/9GHaxNp
 xggrMvphtYPUiDboTwDmjLZ7UtGtLtw=
X-Proofpoint-ORIG-GUID: k5w_BlAfeSRjAvSJTVZSbYDb3fEkaxOo
X-Proofpoint-GUID: k5w_BlAfeSRjAvSJTVZSbYDb3fEkaxOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029



On 10/9/2026 6:38 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 09, 2026 at 02:27:20PM +0530, Saddam Patan wrote:
>> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
>>
>>    Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-hpasslatest
>>
>> for you to fetch changes up to 10a0d758cd7005f323b907061ce09db5dec7ccb3:
> 
> You haven't pushed (or have force-pushed) the branch. Now commits don't
> match.
> 
> lfapply.sh: error: fetched 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856 but
> the mail asks for 10a0d758cd7005f323b907061ce09db5dec7ccb3
> 
> Saddam, please be more careful. Please verify your commits and send a
> new PR.
> 
Sent out an email with new PR.>>
>>    qcom: update HPASS firmware for nord platform (2026-10-09 13:18:04 +0530)
> 

