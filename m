Return-Path: <SRS0=yklG=4L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3AFCAC5B0
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 14:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8D8AC4CEF9; Thu,  2 Oct 2025 14:24:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC6D0C4CEF4
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 14:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC6D0C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929MeZZ009667
	for <linux-firmware@kernel.org>; Thu, 2 Oct 2025 14:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qY4jex+bNN+7Cj5MSWvlDD9o
	uZzrZVw7quOp9KCxze0=; b=cIc0ENAmmHAJ5tljw1/e4mqWtk05KkN2gsQjH9Ad
	SdxuvMwqxlS5qmJ8hMEcZJgQesQh9s7zipOuXfQICOG98AQD0fEWxgb74F6IBSKb
	i3jn1z1UrkqrwP1Mdv8LsPmT6asIA7YJiGXXdGHYsUwA8PD3sN/LtrtY6QzVUDI5
	lkuSiKuMdrpfYoVqKimsZ0ZNf70XRnzxwl5woedtqDfM2YbVasDPQbiP2EzFmcbh
	J578mhsG/5DcDQLAyf0j60a8+qWQ3aG/t6esXRWF4RsYOuPvm0ValCa/peYl7ZkL
	sAQPl8bJW2dfryJqyhFqbMCHb9pg5AKn/coRahFV1cK9Rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hqp9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 14:24:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2698b5fbe5bso11276395ad.0
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 07:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415069; x=1760019869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY4jex+bNN+7Cj5MSWvlDD9ouZzrZVw7quOp9KCxze0=;
        b=v1trmjmog0StA46BoGxWyUwGRiqdyo8hQiD0hWGL6yNJzdBUFecOdJ2pZlIMZ/SPZ4
         iNAU8uHrxf5K/q9ifwENcJFuq5CDh6ug+/+aGGdvPSS9B2P3oyDxV6XIGcgdevqgEKxG
         UjWvlgTg/+1yWe6mEX+1qM229fY5kC8e0vDxhzTvfBc3mhRAI3F7Sjr8tiB8p+48/biB
         XymGpPUZbv9zO9h15soH4wchf9xuVcjOvzoLIO1RntqmyyYsx1lB+jDkaloHHmEMjHlb
         IhLhgdgNKuqTZf5r83h0xSNOGXypTCYGkvKzhxKlUFBhjFCVQfEmj30GalIvGfXLGFlU
         /dlA==
X-Forwarded-Encrypted: i=1; AJvYcCWYfjVLa6MsBnYWdCetgUCzUVBGhhhGBCu3OonW+Z3JkjK8xFEmHn6r9PHV5HYEw+84zYKolXXK/dYbyop5fA==@kernel.org
X-Gm-Message-State: AOJu0YwKIv+lyC/7S/RDAe5pWAlCK9czOk/iTHlY5MzTpezMuP+8d3mY
	GBMUsY2B7Vwk2bPZiBRNobx6Yd4m/rdTCa5GZ0hKzWpMrIijFbwS+S2G35u+qqeank41ucQX+3J
	aGGa9aE+NEDr1ocTL2vVz5fu61SV/wAh5tagJu611OWAHSN5MTan65Ptbxmf4mNTFdNaGafyrFa
	t9k9t39KdToRQxAsexeQr7Z4SSn8XlWIWlHvQA9A==
X-Gm-Gg: ASbGnct1jA6HrKPFvOVm4l++3LOTDOMeh64APyTEIiFrX94sh4svd9CNDB7C7O2XFS8
	HTown5KkIhHnNZJZg8afHf/L4efosYanBUCjdejR0LFz7eOrBS5E9STc/VP4XwxaQPIKQi9G1/P
	vNlO045KkF3XvZeq6wepuogJzXjeGnfIfLx0nJ7UCq
X-Received: by 2002:a17:902:eb8b:b0:272:dee1:c133 with SMTP id d9443c01a7336-28e7f2cfcaemr75266285ad.22.1759415068839;
        Thu, 02 Oct 2025 07:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeBzBT5KX3o1ORVGwXKY3MMFGH9Eu1j9lBu0xex9Z2aw49Xh0FaXZiTzwl5lGbmkvHdShkgu+EISVuOsn1Sjo=
X-Received: by 2002:a17:902:eb8b:b0:272:dee1:c133 with SMTP id
 d9443c01a7336-28e7f2cfcaemr75265985ad.22.1759415068338; Thu, 02 Oct 2025
 07:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com> <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com> <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com> <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
In-Reply-To: <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 17:24:18 +0300
X-Gm-Features: AS18NWCzj4q8dhDGfgTTCldJt9giO-e788X4siq-YO-bNKaZ1D2z7ELwnke4PAY
Message-ID: <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXyMZyUK6ibR1i
 ZjU6JB4OboUiYDy+SHLNa8rZ4VrVQeLFMwxcLXfwgrvnqNWXOKYDofH/u69WnhfolILbCUpZwhP
 wRvWNwypiP6Mbqr0PERnnZxzzUJBmd0KuaiV/oyiX5evCvjpKLwMrsP/UW+UE0h2TW3i24puhFW
 sgo+wJN+mkr0V7shxZFiswmWcyjMxVa1yCPrCK33nBKSc4nu4K8FepwsqWS9c7bRNZEexMqMYz3
 t6rgFlatGKU3sP8S/vvI8ME3F0IaVq7PMimWR4qST0Dhcw5pBw5menbbqj0aB+oMmyl+76mzrtT
 x0K8sBzvLCAUswKw85x+jkxLrVrJl49L+7+rxcu0XbYjvuKEIgSeGo1jqeXlLztxmXUzicESBZG
 X8xYmW0Pzja+oP0tN62W+LQ/90wQbg==
X-Proofpoint-GUID: axcyO_4NgHtTzQ7ezxhZu-6TVMT7XaOw
X-Proofpoint-ORIG-GUID: axcyO_4NgHtTzQ7ezxhZu-6TVMT7XaOw
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68de8b1d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=KKAkSRfTAAAA:8 a=oeP4Tn7BOiwwBamMDKoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Thu, 2 Oct 2025 at 13:22, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/09/2025 13:55, Bryan O'Donoghue wrote:
> > On 24/09/2025 11:43, Dikshita Agarwal wrote:
> >>>> I understand your concern. To clarify, we are not removing support
> >>>> for the
> >>>> existing Gen1 firmware, so backward compatibility remains intact.
> >>>>
> >>>> We are simply adding support for Gen2 firmware for this
> >>>> architecture. As a
> >>>> result, QCM6490 will support both Gen1 firmware (with the Venus
> >>>> driver) and
> >>>> Gen2 firmware (via Qualcomm's video driver [1]).
> >
> > I agree with Dmitry here.
> >
> > Its not possible to disjunct upstream HFI6xx @ the firmware level
> > between Venus and Iris because the DTS would have to point to a
> > particular firmware depending on which driver you wanted to run, which
> > would make the DT dependent on the driver, which is not allowed.
> >
> >>>> Additionally, as part of our plan to transition all Venus-supported
> >>>> targets
> >>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1
> >>>> firmware
> >>>> to maintain backward compatibility.
> >>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> >>> interchangeable for the hardware they both support, until the venus
> >>> driver drops support for V6 hardware. At that point it's expected that
> >>> there will be no V6 support in Venus driver.
> >>>
> >>> You can not simply upgrade to Gen2 firmware as if nothing happened.
> >>> Consider a device node on SC7280 / QCS6490 with the firmware-name
> >>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
> >>> happily consume the device node and try to work with it. One will work,
> >>> another one will fail. This is definitely not what we have agreed upon,
> >>> when you started adding Iris driver.
> >> @Vikash, could you please chime in?
> >
> > It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a
> > new SoC that doesn't appear upstream yet but, that's not the case with
> > 7280/6490.
> >
> > ---
> > bod
>
> So discussing this with Vikash and some other qcom folks, I realised the
> DT binding at the moment doesn't depend on the firmware name, so my
> concern making the DT depend on the driver is not a real problem.

DT bindings include a single optional firmware name.

> I think in fact it should be possible to point venus @ the gen1 firmware
> file while pointing iris @ the gen2 file.
>
> Unless there's something here I'm missing, that should work for the
> update and the agreement.

Both drivers are supposed to work with the same DT entry (that was the
agreement, they should be interchangeable for the migration time).
Consider having a device fused to require vendor key and a venus node
with the firmware-name pointing to the vendor-signed firmware. One of
the drivers will fail to work in such a case.

-- 
With best wishes
Dmitry
