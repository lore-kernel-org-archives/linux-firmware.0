Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA1E606A324
	for <linux-firmware@archiver.kernel.org>; Sun,  1 Nov 2026 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o6luDh7Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXNHhiph
Received: by smtp.kernel.org (Postfix)
	id 1CD851F00919; Sun,  1 Nov 2026 07:24:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793517887;
	b=S+4NqmoaXLJev8RVW5QfDQYD0dALgBRMQFvFebYBdYxNwgvHsKtmvewmSfdBfedq1for
	 yfH/54a6mg/myhTbjgAW6EdTF8CrolVPJ4LcxANemzPvJApSfyp1ZnwBIGg/POUhzBT6n
	 fM7kzJ91chnsvTOOfRerv/Z6emB5MpGs6ixSfZL0TMTdO219cA0rHKVtALAe8VpMiB9AB
	 FCao3NRFagLsmn0yDHSZyd5SXcqtw1q+G6GFgCC2dSKkcRTtUqtMojUZC7WrGFGplKqQg
	 /yeQIQCrma0+cFiVPWinv/Q68c8VrEYmp4qYRi3vGGmQ1UHP4Tm0YybhRqqFnvW76Gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793517887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dAlyPE74zD6SgSp0I3fTaBzShdfQV8xtrPEfcyRVppQ=;
	b=rpMBh/6Sn16oUDAl68MBHiRSbEyqDASH4x4e6ZpRGWY4IOYfL6c3RKxiMwjUKi5E6j7O
	 3JSuqT32mU8ta077BT2UC+0VmHE3S0KD4IUUTBJaA2idm9lQ7KmI5EBjdZYZzZYFm10dk
	 okfi4v2rvfz3ciySLiAD6jVVUPSp3mEXUcviXStec5PQ/Lp3C1yOIxDGK7DTXplwVxqGa
	 vfw5++S8AUSC9zZgC7jNbq3WR9/e2ljdOe2TbrAM8qMwBODA6kKtHKXtxfqYzy47Z3Zz7
	 hGCMEe132ZeS3j4M3oZK2++y4V0615BPaqRz+C6qOt3B4H4Xbwnq4x/TFDFIKRfXCUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o6luDh7Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXNHhiph;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6466F1F000C1
	for <linux-firmware@kernel.org>; Sun,  1 Nov 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o6luDh7Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXNHhiph
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6466F1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15KJhj2569096
	for <linux-firmware@kernel.org>; Sun, 1 Nov 2026 07:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dAlyPE74zD6SgSp0I3fTaB
	zShdfQV8xtrPEfcyRVppQ=; b=o6luDh7YAqIojAiTWe9CMKRYhLx6YVnIrvLrgX
	+fJc5w7P+spib9gmPYfCZD1nQyaLePmcOhcRz8dp2K5Wn4QzTGs9RC7T6Vtnhrun
	qtVVayGIvD+caQzwYWbyzFAKd0w/uGw2olAvuCVL3wcGsHeg1KZCyZI2kDIxf1G9
	hg77xaf9e91cGVmcmw0Fs+aUzivNdi/hSkclxOC98gBWSUXk01UstO715kCxYRce
	wOflqWLov7l+8RHvTbgQOHM6Kc9mkZa+qJ0/VFiJP3olixm3faZyAH4M4ZUV0Egf
	zZT0XMxX6z7UNUlUMnt04ka3STnImS305yN4rgyiF17J3KLg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk2pss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 01 Nov 2026 07:24:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso4660893eec.0
        for <linux-firmware@kernel.org>; Sun, 01 Nov 2026 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793517884; x=1794122684; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dAlyPE74zD6SgSp0I3fTaBzShdfQV8xtrPEfcyRVppQ=;
        b=PXNHhiphMx0l4+yxVVUov/598oeeJZ4arfhN3Oyvaq3KHUmaIpoUdrRLZltytTSctr
         BI7tqL2OwM8bnP8jZ06Bbp4FqO0EBfs/wMoiM7/GmZIZWVIaEQ5xJmRAVNGxPFA8lNl/
         APkk5KBa6kvvM0rCnToF0WT6KkhUZirzOavtiE696b9MiH7Fu38GEZ7Ml1jzkx7Q4H/r
         Olo+8WrUPsg+wjTPv1CcJzl4ipYoz0ZHZiGfveSJ8kBG7sA26FPItc3+xwGXAHz1kcUj
         VA6B/x40u80NxZfsijlptkZpmmOlN6qF2IqTCMWVF5uCxXp2g9EwcXP/q1JHqLeG2LYT
         DKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517884; x=1794122684;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAlyPE74zD6SgSp0I3fTaBzShdfQV8xtrPEfcyRVppQ=;
        b=SRw/SrVMlhNIiFJSdKHYODXLgDBmWyzWQWPM5VZA+lrF3X4TkMpVGYP/VUqkg3SEpW
         NLIsJKqMqNlFeqA2qZWOkdwDfuQhBiBtcFAigvvXbBpcnpGUWMCZFJl7A0cZO6FFPiZr
         epYcPb8kkPSh4cTi7O3qK4pO4ZKuNlnC634UlsVR982gBgAk1owEh8IErcyoQIncfnFB
         Z4t8lTHX1SHVF9jkaEDOSsvXgAvze9mNRNzBBITo5/GTWdqZoBUYXFrBK81N6ktnAHv1
         7W5hR8yeahzE5Hmq9kGkCXt0kzkiMiYBTZbLdIiif8XgPsxLXFzGOId99OKd0n+YTRXa
         81kw==
X-Gm-Message-State: AFq9FYJ9mFfB2jaHHsKM1tP+FFgzvaG3lYOgpAjJgL4z6XYG7wwtFdp8
	FL99MPv+sG30oby3gRHskrW+p7CZzNI86lj7OHmzwKbQe4o4+SUgP2TPoZGMwpm3NwjpJMkaQih
	zS/KCksTYh8TbvTgHDPlpEQ5GPjn9D9Q8BUzF7AtfSfw0+jt7EEahbELrjVZIITLFkb1MwgE=
X-Gm-Gg: AYBFou3R3dq+jV8jPB+kCJ8Qdn36XMUjOde1DiP4NJ4NPMNLUC7o/fZi5CcLgpiyUds
	mbAtGDpwAi2eIui4IIG74Q4vG5xDdiBfxB4OCqBEVV1pjfqNMATaw8kiUVGe9gG81t9f7Gqf0sO
	CZ4NM1bTTzWWml6WUbKIvagI6Tuhy5Opim0Ehmcr71Udse3CjGV0Tfi9L9NC2L5nuVu2/8sd/Oi
	/PsOKmT3RjX+vp7W1lexpWWlyRTEY9TQKy4ZsUxwavK+iOnmMXsdDKD6UMkUKMqUqWdEmu6jMzz
	KLctXJxn1qs+GRNJFIX4rmD0Tk5/6ufl3NO7sILB6+U6dqnGDmYHAe5KUmJgMv9k71YuIBhAVWV
	0qycOAlca6v4ZF4I/l1qiRDWzPCXfv8N/sXk19RGjNjDqihwO3lOjeNASrSf+ygPQLdYX8P01Qk
	o7OUQ=
X-Received: by 2002:a05:7022:5f02:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1abe9b88aaamr10095404c88.5.1793517884405;
        Sun, 01 Nov 2026 00:24:44 -0700 (PDT)
X-Received: by 2002:a05:7022:5f02:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1abe9b88aaamr10095384c88.5.1793517883715;
        Sun, 01 Nov 2026 00:24:43 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm21924038c88.14.2026.11.01.00.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 00:24:42 -0700 (PDT)
Message-ID: <07f7217a-f80e-4d63-ac36-5466f30f5911@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 12:54:39 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: Update HPASS firmware for Qualcomm nord platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XAjWeJOdUJngRHie9yXrchqh6rXBF8nz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAyOSBTYWx0ZWRfX2KFP7KOba4VM
 O9bgAPV/iLRN5cIPtfX3ilp9sfol8SbxpX3JSXOkEk2DqQOrWz31jbjvUMhqn8nfUdyQRtTeoXa
 RDytQlnJ2nmhUKy6N4PwDjGZ5frwdwO/9KWfZ+W05Z/fdfWkhRMP0QX0EXmHuARlpXko61ry/Jt
 GQvUHhA/bTXMPdX+ZEJWbvxWUujG02IhohdL7PHNf+Ez75Da1myWjnpT50XWUWJkEEvgVSTy1Ht
 aYJr6B+rv/9uLs/TXA2w5FEGhaOiCNp1t462w6Q0TjWt49YfKN4G40OK7zPubqn58ZVNEfDBNYW
 dt3bHhXv6wJqKJu9B3EMqNENX+h/99O5EvtkcyBx7MtSa6iUsfpXK9O9jjFa2DkSDIUjvM4hXph
 EFR+bNBBtbHYWav7bU80UqZSaTJHP2+9mttkaWucqobiXCouhvGCvPzu+i/Fop6KRrR1KeCue2R
 U46kwbhjKv5nsR9v8ig==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae6e93d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=ONb4SosybOGn01TQ2i8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAyOSBTYWx0ZWRfX1O91qG/2ww3M
 Wc9DuogUpN1E0Na0Qby8ZxrsJ9HW4kUys6Oi8x51YenSkpZbClMcAM1JnqyxdIXku4OQYRfhRK5
 yadB/l7FUAhOd7l9JorJAenKvj2u3CY=
X-Proofpoint-ORIG-GUID: XAjWeJOdUJngRHie9yXrchqh6rXBF8nz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010029
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit bda6eccc3a8f52e00696cf733b6e4f042d56655c:

   Merge branch 'robot/pr-0-1793289289' into 'main' (2026-10-31 18:25:38 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qli-fw-nord

for you to fetch changes up to 28013a9738ae2809faef40e1d1bda735af8dd011:

   Update HPASS firmware for Qualcomm nord platform. (2026-11-01 
12:50:25 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       Update HPASS firmware for Qualcomm nord platform.

  WHENCE                  |   2 +-
  qcom/nord/adsp.mbn      | Bin 8950424 -> 7930520 bytes
  qcom/nord/adsp1.mbn     | Bin 3470272 -> 3482560 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 73728 -> 73728 bytes
  qcom/nord/adsp_dtb.mbn  | Bin 85864 -> 85864 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)
